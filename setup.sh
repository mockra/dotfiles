#!/usr/bin/env bash

set -Eeuo pipefail

exec > >(tee -ia "$HOME/dotfiles_install.log") 2>&1

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
COPILOT_CONFIG_REPO="${COPILOT_CONFIG_REPO:-mockra/copilot-config}"

trap 'echo "==> Dotfiles setup failed at line $LINENO. See $HOME/dotfiles_install.log."' ERR

log() {
  echo "==> $*"
}

link_file() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "$target")"
  ln -sfn "$source" "$target"
}

install_system_packages() {
  log "Installing system packages"
  sudo apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    fuse \
    ripgrep \
    silversearcher-ag \
    tmux \
    universal-ctags
}

install_neovim() {
  local version="v0.11.4"
  local arch

  case "$(uname -m)" in
    x86_64 | amd64) arch="x86_64" ;;
    aarch64 | arm64) arch="arm64" ;;
    *)
      echo "Unsupported architecture for Neovim: $(uname -m)" >&2
      return 1
      ;;
  esac

  if command -v nvim >/dev/null 2>&1 &&
      nvim --version | head -1 | grep -Fq "NVIM ${version}"; then
    return
  fi

  local install_dir="/opt/nvim-${version}-${arch}"
  local archive="nvim-linux-${arch}.tar.gz"

  log "Installing Neovim ${version}"
  sudo mkdir -p "$install_dir"
  curl -fsSL "https://github.com/neovim/neovim/releases/download/${version}/${archive}" |
    sudo tar -xz --strip-components=1 -C "$install_dir"
  sudo ln -sfn "${install_dir}/bin/nvim" /usr/local/bin/nvim
}

install_fzf() {
  log "Installing fzf"
  if [ -d "$HOME/.fzf/.git" ]; then
    git -C "$HOME/.fzf" pull --ff-only
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  fi
  "$HOME/.fzf/install" --all
}

install_node_and_copilot() {
  export NVM_DIR="$HOME/.nvm"

  if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    log "Installing nvm"
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  fi

  # shellcheck source=/dev/null
  source "$NVM_DIR/nvm.sh"
  nvm install 24
  nvm alias default 24

  log "Installing Copilot CLI"
  npm install -g @github/copilot@latest
  command -v copilot >/dev/null
}

configure_dotfiles() {
  log "Linking dotfiles from $DOTFILES_DIR"

  link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
  link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
  link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
  link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
  link_file "$DOTFILES_DIR/.agignore" "$HOME/.agignore"
  link_file "$DOTFILES_DIR/.ignore" "$HOME/.ignore"

  mkdir -p "$HOME/.vsnip" "$HOME/.config/nvim"

  local source
  for source in "$DOTFILES_DIR"/.vsnip/*; do
    [ -e "$source" ] || continue
    link_file "$source" "$HOME/.vsnip/$(basename "$source")"
  done

  for source in "$DOTFILES_DIR"/.config/nvim/*; do
    [ -e "$source" ] || continue
    link_file "$source" "$HOME/.config/nvim/$(basename "$source")"
  done
}

copilot_config_token() {
  if [ -n "${COPILOT_CONFIG_TOKEN:-}" ]; then
    printf '%s' "$COPILOT_CONFIG_TOKEN"
    return
  fi

  if command -v gh >/dev/null 2>&1; then
    local token
    token="$(gh auth token 2>/dev/null || true)"
    if [ -n "$token" ] &&
        GH_TOKEN="$token" gh api "repos/$COPILOT_CONFIG_REPO" >/dev/null 2>&1; then
      printf '%s' "$token"
    fi
  fi
}

configure_copilot() {
  local token
  token="$(copilot_config_token)"

  if [ -z "$token" ]; then
    cat >&2 <<EOF
==> Copilot config was not installed.
    Add a Codespaces secret named COPILOT_CONFIG_TOKEN with read-only Contents
    access to https://github.com/$COPILOT_CONFIG_REPO, then create a new
    Codespace or rerun $DOTFILES_DIR/setup.sh.
EOF
    return
  fi

  local copilot_dir="$HOME/.copilot"
  local config_dir="$copilot_dir/config-repo"
  local basic_auth
  basic_auth="$(printf 'x-access-token:%s' "$token" | base64 | tr -d '\n')"

  mkdir -p "$copilot_dir"

  if [ -d "$config_dir/.git" ]; then
    log "Updating Copilot config from $COPILOT_CONFIG_REPO"
    git -c "http.extraHeader=Authorization: Basic ${basic_auth}" \
      -C "$config_dir" pull --ff-only
  else
    log "Cloning Copilot config from $COPILOT_CONFIG_REPO"
    git -c "http.extraHeader=Authorization: Basic ${basic_auth}" \
      clone --quiet "https://github.com/${COPILOT_CONFIG_REPO}.git" "$config_dir"
  fi

  local file
  for file in copilot-instructions.md review-style.md settings.json; do
    if [ -f "$config_dir/$file" ]; then
      install -m 600 "$config_dir/$file" "$copilot_dir/$file"
    fi
  done

  if [ -f "$config_dir/mcp-config.json" ]; then
    install -m 600 "$config_dir/mcp-config.json" "$copilot_dir/mcp-config.json"
  fi

  mkdir -p "$copilot_dir/skills"
  local skill_file
  for skill_file in "$config_dir"/skills/*/SKILL.md; do
    [ -e "$skill_file" ] || continue
    local skill_dir
    skill_dir="$(dirname "$skill_file")"
    link_file "$skill_dir" "$copilot_dir/skills/$(basename "$skill_dir")"
  done

  log "Installed Copilot instructions, settings, MCP config, and skills"
}

install_neovim_plugins() {
  log "Installing Neovim plugins"
  curl -fsSLo "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim --headless "+Lazy! sync" +qa
}

main() {
  log "Running dotfiles setup from $DOTFILES_DIR"

  if [ "${DOTFILES_SKIP_SYSTEM_INSTALL:-false}" != "true" ]; then
    install_system_packages
    install_neovim
    install_fzf
    install_node_and_copilot
    install_neovim_plugins
  fi

  configure_dotfiles
  configure_copilot

  if [ "${DOTFILES_SKIP_SHELL_CHANGE:-false}" != "true" ]; then
    sudo chsh -s "$(command -v zsh)" "$(whoami)"
  fi

  log "Dotfiles setup complete"
}

main "$@"
