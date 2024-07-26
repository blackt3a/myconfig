-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
--
--
vim.keymap.set("i","jk","<ESC>")



--多行移动
--vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
--vim.keymap.set("v","K",":m '<-2<CR>gv=gv")


--窗口
--
vim.keymap.set("n","<leader>sv","<C-w>v") --水平方向
vim.keymap.set("n","<leader>sh","<C-w>s") --垂直方向
--vim.keymap.set("n","<C-K>","<C-V>")


--主题
lvim.colorscheme = 'desert'

--取消高亮
--vim.keymap.set("n","<leader>nh",":nohl<CR>")


vim.opt.signcolumn = "yes"

vim.ignorecase = true
vim.opt.smartcase = true

--增加鼠标模式
vim.opt.mouse:append("a")


--复制vim到win
vim.opt.clipboard = "unnamedplus"



--以下是官方的的配置，但是本地复制时会有个10秒 的延迟，很难受
--[[ vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
} ]]





vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
        local copy_to_unnamedplus = require('vim.ui.clipboard.osc52').copy('+')
        copy_to_unnamedplus(vim.v.event.regcontents)
        local copy_to_unnamed = require('vim.ui.clipboard.osc52').copy('*')
        copy_to_unnamed(vim.v.event.regcontents)
    end
})


















--jk自动保存
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
          callback = function()
            vim.fn.execute("silent! write")
            vim.notify("Autosaved!", vim.log.levels.INFO, {})
        end,
    })
--块视图模式
--修改terminal配置文件(json）,

--注释掉 ctrl v 那行

--// { "command": "paste", "keys": "ctrl+v" },




--复制的一些官方配置模板
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true -- wrap lines

-- use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
