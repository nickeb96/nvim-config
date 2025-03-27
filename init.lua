
-- Reduce shada jump records to 5 files and disable '/' history
vim.opt.shada = {"!", "'5", "<100", "s4", "h", "/0", ":10", "@0"}

-- Set in-memory history of : and / to 10
vim.opt.history = 10

-- Use persistent undo
-- vim.opt.undofile = true

-- Limit undos to 100
vim.opt.undolevels = 100

vim.cmd [[
  call plug#begin('~/.local/share/nvim/site/plugs')
  source ~/.config/nvim/packages.vim
  call plug#end()
]]

-- Use true colors instead of default
vim.opt.termguicolors = true

-- Fix cursor shape on entry and exit
vim.api.nvim_create_augroup("set_cursor_shape", { clear = true })
vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
  pattern = "*",
  group = "set_cursor_shape",
  command = "set guicursor=a:hor20",
})
vim.api.nvim_create_autocmd({"VimResume"}, {
  pattern = "*",
  group = "set_cursor_shape",
  command = "set guicursor&",
})

-- Enable syntax based folding
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 0

-- Disable lsp diagnostic column
vim.opt.signcolumn = "no"

-- Remember cursor position from last session
vim.api.nvim_create_augroup("remember_cursor_position", { clear = true })
vim.api.nvim_create_autocmd({"BufReadPost"}, {
  pattern = {"*.rs", "*.py", "*.lua", "*.scm", "*.html", "*.css", "*.js", "*.pdf", "*.md", "*.yaml"},
  group = "remember_cursor_position",
  callback = function()
    vim.cmd [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
  end,
})

-- Highlight yanked test for a bit
vim.api.nvim_create_autocmd({"TextYankPost"}, {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "CurSearch", timeout = 300 }
  end,
})

-- Abbreviate lua= as L
vim.cmd.cabbrev("L", "lua=")

-- Limit filenames for gf, gF, etc.
vim.opt.isfname = "@,48-57,-,_,.,/,$,~"

-- Make statusline show useful information
vim.opt.statusline = "%<%f  %h%m%r%=%a%=%y   %{&fileencoding} %6.(0x%02.B%)  %7.((%o)%)   %-10.(%l:%c%V%)  %P"

-- Have only one status line instead of one per window
vim.opt.laststatus = 2

-- Make screen scroll 10 lines before end
vim.opt.scrolloff = 10

-- Make CTRL-U and CTRL-D move 10 lines at a time
vim.opt.scroll = 10

-- Scroll horizontally by 8 columns at a time
vim.opt.sidescroll = 8

-- Allow scrolling by one line at a time with soft line wraps
vim.opt.smoothscroll = true

-- Use ? for :nohl instead of reverse search
vim.keymap.set({"n", "v"}, "?", function()
  vim.cmd.nohl()
  vim.cmd.echon("''")
end)

-- Use hybrid relative/absolute line numbers when the terminal is wide enough
if vim.opt.columns:get() >= 84 then
  vim.opt.relativenumber = true
  vim.opt.number = true
  vim.api.nvim_create_augroup("disable_relativenumber_in_term", { clear = true })
  vim.api.nvim_create_autocmd({"TermOpen"}, {
    pattern = "*",
    group = "disable_relativenumber_in_term",
    command = "set norelativenumber",
  })
end


-- Toggle tab completion in plugin/lspconfig.lua
vim.keymap.set({"n"}, "g<Tab>", function()
  vim.g.ENABLE_TAB_COMPLETION = not vim.g.ENABLE_TAB_COMPLETION
end)

-- Allow selected text to be moved up or down with J and K
vim.keymap.set({"v"}, "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set({"v"}, "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Fix CTRL-C not working with [count]
vim.keymap.set({"i", "v"}, "<C-c>", "<Esc>")

-- Disable mouse
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

-- Map scroll wheel to screen scrolling instead of cursor vertical movement
vim.keymap.set({"n"}, "<ScrollWheelUp>", "<C-Y>")
vim.keymap.set({"n"}, "<ScrollWheelDown>", "<C-E>")

-- Use CTRL-H for to show treesitter groups
vim.keymap.set({"n"}, "<C-H>", "<Cmd>Inspect<CR>")

-- Preserve file creaton time
vim.opt.backupcopy = "yes"

-- Use fish as the internal shell
vim.opt.shell = "fish"

-- Only pipe stdout from external commands with `!` prefix
vim.opt.shellredir = ">%s"

-- Turn off auto scrolling in markdown preview
vim.g.mkdp_preview_options = { disable_sync_scroll = 1 }

-- Fix syntax highlighting in shell scripts
vim.g.is_posix = 1

-- Use C syntax highlighting for .h files instead of C++
vim.g.c_syntax_for_h = 1

-- Disable sql overrides that cause input hanging
vim.g.ftplugin_sql_omni_key = vim.v.null

-- Inform vim that you are using two spaces as sentence separators
vim.opt.cpoptions:append("J")
vim.opt.joinspaces = true
vim.opt.spellcapcheck = "[.?!] \\{2}"

-- Disable line wrapping all together
vim.opt.wrap = false

-- Set characters to break after
vim.opt.breakat = "\t !*-+;:=,./?|"

-- Disable .netrwhist files from being generated
vim.g.netrw_dirhistmax = 0

-- Disable netrw banner
vim.g.netrw_banner = 0

-- Make netrw open files in new vertical windows with a width of 90 columns
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_preview = 1
-- vim.g.netrw_winsize = -90

-- Sort by file name
vim.g.netrw_sort_by = "name"
vim.g.netrw_sort_sequence = ""

-- Diff Mode options
vim.opt.diffopt = {"filler", "internal", "algorithm:histogram", "linematch:60"}

-- List mode symbols
vim.opt.listchars = {
  eol = "\u{21B5}",
  tab = "\u{2504}\u{2504}\u{2524}",
  space = "\u{2022}",
  leadmultispace = "\u{2027}\u{2027}\u{2027}\u{25e6}",
  nbsp = "\u{25a0}",
  trail = "\u{2593}",
  extends = "\u{2192}",
  precedes = "\u{2190}",
}

-- Fix line endings
vim.opt.fileformats = {"unix", "dos"}
vim.opt.fileformat = "unix"

-- Recognize euc-jp file encoding
vim.opt.fileencodings = {"ucs-bom", "utf-8", "euc-jp", "default", "latin1"}

-- Disable nroff directives for paragraph motions
vim.opt.paragraphs = ""
vim.opt.sections = ""

-- Expand tabs to spaces
vim.opt.expandtab = true

-- Width of a tab
vim.opt.tabstop = 4

-- Use 'tabstop' for numbor of spaces <, >, and indent use
vim.opt.shiftwidth = 0

-- Use 'shiftwidth' for virtual tab width
vim.opt.softtabstop = -1

-- Round <, > shift to nearest mustiple of shiftwidth
vim.opt.shiftround = true


-- local _, current_bg = pcall(function()
--   return vim.uv.fs_readlink(vim.env.HOME.."/.config/alacritty/colors/current.toml")
-- end)
-- if current_bg == "dark.toml" then
--   vim.opt.background = "dark"
-- elseif current_bg == "light.toml" then
--   vim.opt.background = "light"
-- end

vim.cmd.colorscheme "phoenix"

-- vim.cmd [[
-- imap <C-j> <Plug>(skkeleton-enable)
-- call skkeleton#config({
--   \ 'keepState': v:true,
--   \ 'keepMode': v:true,
--   \ 'globalDictionaries': ['/Users/Nick/SKK-JISYO.L'],
--   \ 'eggLikeNewline': v:true
--   \ })
-- ]]

if vim.g.neovide then
  vim.opt.guifont = "SauceCodePro Nerd Font:h16"
  vim.g.neovide_input_macos_alt_is_meta = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", '<C-R>+') -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<C-o>"+P') -- Paste insert mode
  vim.defer_fn(function()
    vim.cmd "NeovideFocus"
  end, 100)
end

