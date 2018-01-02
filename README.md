<p align="right">
    <a href="https://travis-ci.org/l5x/vim">
        <img src="https://travis-ci.org/l5x/vim.svg?branch=master"
             alt="build status">
    </a>
</p>

## Installation

```sh
git clone --depth 1 --recursive https://github.com/l5x/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
~/.vim/manage install
```

## Cheat Sheet

|                | Vim
|             ---|---
| \\-q           | Deletes the current buffer and closes the current window
| \\-Q           | Deletes the current buffer and preserves the current window
| \\-f           | File finder
| \\-m           | Most recently used (MRU) files finder
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

|                | CtrlP (open)
|             ---|---
| F5             | Purge the cache for the current directory
| c-f c-b        | Cycle between modes
| c-r            | Switch to regexp mode
| c-j c-k        | Navigate the result list
| c-t c-v c-x    | Open the selected entry in a new tab or in a new split
| c-n c-p        | Select the next/previous string in the prompt's history
| c-y            | Create a new file and its parent directories
| c-z c-o        | Mark/unmark multiple files and open them

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
