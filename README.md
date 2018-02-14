<p align="right">
    <a href="https://travis-ci.org/l5x/vim">
        <img src="https://travis-ci.org/l5x/vim.svg?branch=master"
             alt="build status">
    </a>
</p>

## Installation

```sh
git clone --depth 1 --recursive https://github.com/l5x/vim.git ~/.vim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/vimrc ~/.vimrc
~/.vim/manage install
```

## Cheat Sheet

|                | Vim
|             ---|---
| \\-q           | Deletes the current buffer and closes the current window
| \\-Q           | Deletes the current buffer and preserves the current window
| \\-f           | File finder
| \\-b           | Buffer finder
| \\-c           | Choose Window
| \\-u           | Undo tree
| s              | Sneak is invoked with s followed by exactly two characters
| zz             | Move current line to the middle of the screen
| zt             | Move current line to the top of the screen
| zb             | Move current line to the bottom of the screen
| Ctrl-e         | Moves screen up one line
| Ctrl-y         | Moves screen down one line
| Ctrl-u         | Moves screen up ½ page
| Ctrl-d         | Moves screen down ½ page
| Ctrl-b         | Moves screen up one page
| Ctrl-f         | Moves screen down one page

|                    | TComment
|                 ---|---
| gc{motion}         | Toggle comments
| gc{Count}c{motion} | Toggle comment text with count argument
| gcc                | Toggle comment for the current line
| gC{motion}         | Comment region
| gCc                | Comment the current line

|                    | sort motion
|                 ---|---
| gs{motion}         | Linewise

|                    | ale
|                 ---|---
| c-n                | next error/warning
| c-p                | previous error/warning
