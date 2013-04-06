# Repository for config files

My repository for useful config files

## How to install

      git clone git://github.com/greenolvi/dotfiles.git
      cd dotfiles
      git submodule init
      git submodule update

Now you need to create symbolic links in your `$HOME`

### Bash aliases

      ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
   
Many `.bashrc` files have included sourcing of separate aliases file. If not then you need to add this line to your `.bashrc`:

      . ~/.bash_aliases

### Git

      ln -s ~/dotfiles/gitconfig ~/.gitconfig
   
### GNU Screen

      ln -s ~/dotfiles/screenrc ~/.screenrc

### MySql client

      ln -s ~/dotfiles/my.cnf ~/.my.cnf
   
### perltidy

      ln -s ~/dotfiles/perltidy ~/.perltidy

### VIM

      ln -s ~/dotfiles/vim ~/.vim
      ln -s ~/dotfiles/vim/vimrc ~/.vimrc
      ln -s ~/dotfiles/vim/gvimrc ~/.gvimrc
