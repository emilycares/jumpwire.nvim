# jumpwire
This tool is for moving in common File structures. The most common use case is
to switch between implementation and test file.

## Installation
Use your favorite plugin manager.

1. Add `Plug 'micmine/jumpwire.nvim'` to init.vim
2. Run `:PlugInstall`
3. Follow the guide in [config.md](config.md)
4. Add shortcuts
```vim
noremap <leader>mt :lua require('jumpwire').jump('test')<CR>
noremap <leader>mi :lua require('jumpwire').jump('implementation')<CR>
noremap <leader>mm :lua require('jumpwire').jump('markup')<CR>
noremap <leader>ms :lua require('jumpwire').jump('style')<CR>
```
