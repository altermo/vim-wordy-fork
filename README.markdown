# vim-wordy-fork.nvim

A rewrite of [vim-wordy](https://github.com/preservim/vim-wordy) in lua.
This README will only go through new features and removals.
If you want to know what this plugin does, read the [vim-wordy-README](https://github.com/preservim/vim-wordy/blob/master/README.markdown).
Note that this plugin doesn't use `setup`.


## Removed

+ Ring navigation was removed, users can create their own functions for this.
+ `{Source}Wordy` was removed as they are depreciated, use `:Wordy {source}` instead.

## New features

+ Toggle: You can now toggle with `WordyToggle` or `require'wordy'.toggle(source)`.
    + `source` can be a string, a list of strings or nil.
    + If `source` is nil, it will enable previous sources.
+ Disable: You can now disable with `require'wordy'.disable()`.
+ Enable: You can now enable with `require'wordy'.enable(source?)`.
    + `source` can be a string, a list of strings or nil.
    + If `source` is nil, it will enable previous sources.
+ Current: `require'wordy'.sources` will contain the current sources.
