# README

## Getting Started

### Clone Repo

`git clone git@github.com:mockra/dotfiles.git .`

### Homebrew

Visit [homebrew website](https://brew.sh/) for install commands

Run: `brew bundle`

### Monolith Git Config
```
watchman watch-project ~/my-mono-repo
cd ~/my-mono-repo
git config core.fsmonitor rs-git-fsmonitor
```

### Codespaces

Select `mockra/dotfiles` under the
[Codespaces dotfiles settings](https://github.com/settings/codespaces). New
Codespaces run `setup.sh` automatically.

Copilot configuration and personal scripts are loaded from the private
[`mockra/copilot-config`](https://github.com/mockra/copilot-config) and
[`mockra/dotfile-scripts`](https://github.com/mockra/dotfile-scripts)
repositories. Create a fine-grained personal access token with read-only
Contents access to both repositories, then add it as a Codespaces secret named
`COPILOT_CONFIG_TOKEN`. Grant the secret access to every repository where the
configuration should be installed.
