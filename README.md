## Vim-counterpoint

### vim/neovim plugin for [pointfree](https://github.com/bmillwood/pointfree) and [pointful](http://github.com/23Skidoo/pointful)

A small wrapper to fix some issues I had when running these utilities with `!`.

1. Install with [vim-plug](https://github.com/junegunn/vim-plug), or any other way.
2. pointfree and pointful utillites must be installed and in `$PATH`.

#### Mappings:
- `<Leader>h.` to run pointfree
- `<Leader>h>` to run pointful

Disable default mappings with `g:contrapoint_enablemappings=0` and check `ftplugins` to make custom ones.

