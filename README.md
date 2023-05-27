
##### With local ssh keys on GitHub:
```sh
git clone git@github.com:nickeb96/nvim-config.git ~/.config/nvim
```
##### Without:
```sh
git clone https://github.com/nickeb96/nvim-config.git ~/.config/nvim
```


How to Update Spell Files
-------------------------

1.  `cd` to `~/.config/nvim/spell/` first
2.  run `:mkspell! en en_US en_SW`
    + The `!` overwrites the existing `.spl` file


To Do Next
----------

- [ ] Make comment auto formatting work for all source code languages
- [x] Fix cursor highlighting when under a parenthesis/bracket/brace in Molokai
- [x] Fix pdf's rulerformat being override by custom statusline
- [x] Add plug.vim.old to .gitignore
- [x] Make syntax/fish.vim more accurately match shell syntax highlighting

