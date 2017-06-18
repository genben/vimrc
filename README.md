VIMRC
========

My vim configuration files.
It includes setup script, which creates symbolic links in HOME directory.


Installation on Linux
---------------------

Install Git

Clone Git repository somewhere:

``` bash
git clone --recursive https://github.com/genben/vimrc
cd vimrc
```

Run installation script:

``` bash
./vim-create-links.sh
```

Install Vim
``` bash
sudo apt-get install vim
```


Restart VIM

Installation on Windows
-----------------------

Install Git

Clone Git repository somewhere:
``` bash
git clone https://github.com/genben/vimrc
cd vimrc
```

Run installation script (with admin rights).
This will create soft links in C:\User\<user> directory
``` bash
vim-create-links.bat
```
