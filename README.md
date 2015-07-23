# whit-vim

    git clone https://github.com/epiloque/whit-vim
    ln -s $(pwd)/whit-vim ~/.vim
    ln -s $(pwd)/whit-vim/vimrc ~/.vimrc
    ~/.vim/tools/update

# Cheat Sheet

|                | Vim
|             ---|---
| \\-q           | Deletes the current buffer and closes the current window
| \\-Q           | Deletes the current buffer and preserves the current window
| \\-f           | File finder
| \\-m           | Most recently used (MRU) files finder
| \\-f           | Buffer finder
| \\-s           | Check syntax
| \\-u           | Undo tree
| zz             | move current line to the middle of the screen
| zt             | move current line to the top of the screen
| zb             | move current line to the bottom of the screen
| Ctrl-e         | Moves screen up one line
| Ctrl-y         | Moves screen down one line
| Ctrl-u         | Moves screen up ½ page
| Ctrl-d         | Moves screen down ½ page
| Ctrl-b         | Moves screen up one page
| Ctrl-f         | Moves screen down one page


|                | Python-Mode
|             ---|---
| [[             | Jump to previous class or function
| ]]             | Jump to next class or function
| [M             | Jump to previous class or method
| ]M             | Jump to next class or method
| aC             | Select a class. Ex: vaC, daC, yaC, caC
| iC             | Select inner class. Ex: viC, diC, yiC, ciC
| aM             | Select a function or method. Ex: vaM, daM, yaM, caM
| iM             | Select inner function or method. Ex: viM, diM, yiM, ciM

|                | CtrlP (open)
|             ---|---
| F5             | purge the cache for the current directory
| c-f c-b        | cycle between modes
| c-r            | switch to regexp mode
| c-j c-k        | navigate the result list
| c-t c-v c-x    | open the selected entry in a new tab or in a new split
| c-n c-p        | select the next/previous string in the prompt's history
| c-y            | create a new file and its parent directories
| c-z c-o        | mark/unmark multiple files and open them

|                    | TComment
|                 ---|---
| gc{motion}         | Toggle comments
| gc{Count}c{motion} | Toggle comment text with count argument
| gcc                | Toggle comment for the current line
| gC{motion}         | Comment region
| gCc                | Comment the current line
