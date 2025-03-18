vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.o.expandtab = true 
vim.o.relativenumber = true
-- vim.wo.signcolumn = "no"
vim.opt.fillchars = { 
  horiz = '━', 
  horizup = '┻', 
  horizdown = '┳', 
  vert = '▌', 
  vertleft = '┫', 
  vertright = '┣', 
  verthoriz = '╋', 
  eob = " "
}

vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd({ "VimResized" }, {
    desc = "Resize nvim-tree if nvim window got resized",

    group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
    callback = function()
        local percentage = 20

        local ratio = percentage / 100
        local width = math.floor(vim.go.columns * ratio)
        vim.cmd("tabdo NvimTreeResize " .. width)
    end,
})
