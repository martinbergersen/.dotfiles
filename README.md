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
   sudo apt install python-pip3
   ```

3. Install [vim-plug](https://github.com/junegunn/vim-plug):

   ```shell
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. Create symlinks:

    ```shell
    cp $HOME/.bashrc $HOME/.bashrc_old; rm $HOME/.bashrc; ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
    ```
    ```shell
    cp $HOME/.bashrc $HOME/.vimrc_old; rm $HOME/.vimrc; ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
    ```
    ```shell
    cp $HOME/.tmux.conf $HOME/.tmux.conf_old; rm $HOME/.tmux.conf; ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
    ```
5. Start vim and run:

    ```shell
    :PlugInstall
    ```

## Author

by Martin Bergersen - 2020