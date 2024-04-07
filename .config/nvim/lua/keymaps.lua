-- Key mappings
require('mapx').setup{ global = true }

map("<leader>bi", ":!bundle install<cr>")
map("<leader>v", ":vsplit<cr>")
map("<leader>a", ":A<cr>")
map("<leader>w", ":w<cr>")
map("<leader>g", ":%s/\\<<C-r><C-w>\\>/")
map("<leader>p", ":r !pbpaste<cr>")
map("<leader>D", ":call delete(expand('%')) \\| bdelete!<cr>")
map("<leader>s", ":%sort<cr>")
map("<leader>q", ":q<cr>")
map("<leader>h", ":s/:\\([^ ]*\\)\\(\\s*\\)=>/\\1:/g<cr>")
map("<leader>o", ":Goyo<cr>")
vnoremap("<leader>y", ":OSCYankVisual<CR>")
nnoremap("<leader>yf", ":let @*=expand('%')<CR>")

vnoremap("<leader>s", "<esc>:lua require('spectre').open_visual()<CR>")

nmap("<leader>t", ":w | :TestNearest | :VimuxZoomRunner<CR>", "silent")
map("<leader>T", ":w | :TestFile | :VimuxZoomRunner<CR>", "silent")
nmap(":W", ":w")
nmap(":W!", ":w!")
nmap(":Q", ":q")
nmap(":Q!", ":q!")
nmap(":Wq!", ":wq!")
nmap(":WQ!", ":wq!")

map("<leader>f", ":Telescope live_grep<cr>")
nnoremap("go", ":Telescope find_files shorten_path=true<CR>", "silent")
nnoremap("gr", ":Telescope oldfiles<CR>", "silent")

map("<Leader>z", ":VimuxZoomRunner<CR>")
map("<leader>n", ":Rename ")
