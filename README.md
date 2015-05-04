VIMRC
========

My vim configuration files.
It includes setup script, which creates symbolic links in HOME directory.


Installation on Linux
---------------------

Install Git

Clone Git repository somewhere:

``` bash
git clone git://github.com/genben/vimrc vimrc
cd vimrc
```

Run installation script:

``` bash
chmod +x vim-create-links.sh
./vim-create-links.sh
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

Installation on Windows
-----------------------

Install Git

Clone Git repository somewhere:
``` bash
git clone git://github.com/genben/vimrc vimrc
cd vimrc
```

Run installation script (with admin rights).
This will create soft links in C:\User\<user> directory
``` bash
vim-create-links.bat
```

Install Vundle
``` bash
cd C:\User\<user>\.vim\bundle
git clone https://github.com/gmarik/Vundle.vim
```

Start VIM and install all plugins.
Important: if Cygwin is installed and it is in PATH before Mingw GIT, then it will cause problems.
Solution: run GIT bash and from it run console vim instead of GVIM.
``` bash
:PluginInstall
```


Build vimproc.
Start Visual Studio Command Prompt 2010+
```bash
cd C:\User\<user>\.vim\bundle\vimproc.vim
nmake -f make_msvc.mak nodebug=1
```
