VIMRC
========

My vim configuration files.
It includes setup script, which creates symbolic links in HOME directory.


Installation on Linux
---------------------

``` bash
git clone git://github.com/genben/vimrc ~/vimfiles
cd ~/vimfiles
./vim-create-links.sh
```


Installation on Linux
---------------------

Install Git

Clone Git repository somewhere:

``` bash
git clone git://github.com/genben/vimrc vimrc
```

Run installation script:

``` bash
chmod +x vim-create-links.sh
./vim-create-links.bat
```

Install Vim
``` bash
sudo apt-get install vim
```

Install Vundle
``` bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Start VIM and install all plugins
``` bash
:PluginInstall
```

Build vimproc
```bash
cd ~/.vim/bundle/vimproc.vim
make
```


Restart VIM
