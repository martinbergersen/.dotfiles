.dotfiles
=========

My personal config files

## Files

* `README.md` --- This readme file
* `.bashrc` --- Bash config
* `.vimrc` --- VIM config
* `.tmux.conf` --- Tmux config
* `powerline.sh` --- Powerline config

## Install

1. Clone the repo to your home folder:

   ```shell
   git clone git@github.com:martinbergersen/.dotfiles.git #HOME
   ```

2. Install required packages:

   ```shell
   sudo apt install vim tmux python-pip3 tty-clock
   ```

3. Create symlinks:

    ```shell
    mv $HOME/.bashrc $HOME/.bashrc_old; ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
    ```
    ```shell
    mv $HOME/.bashrc $HOME/.vimrc_old; ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
    ```
    ```shell
    mv $HOME/.tmux.conf $HOME/.tmux.conf_old; ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
    ```

4. Install [vim-plug](https://github.com/junegunn/vim-plug):

   ```shell
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

5. Start vim and run:

    ```shell
    :PlugInstall
    ```

## Author

by Martin Bergersen - 2020