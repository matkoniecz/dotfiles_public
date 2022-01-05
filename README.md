To apply config to a new computer and test whether it works by runnning `g ll` (readable git log):

```
sudo apt-get install -y ruby git python
```
and then, after typing password and installing
```
mv ~/.bashrc ~/.default_and_replaced_bashrc # prepare for replacement with prepared one
cd ~/Desktop
git clone https://github.com/matkoniecz/my_public_dotfiles.git
cd my_public_dotfiles
ruby install.rb
exec bash
g ll
```
In VirtualBox install also what Guest Additions need + SSH support. For Ubuntu replacing featherpad is necessary as it is useless as a code editor (tab/space, line numbers). Geany is not ideal but at least it works (see a [longer discussion in my full ansible setup](https://github.com/matkoniecz/recovery-with-ansible/blob/master/roles/code_editor_generic_for_everything/tasks/main.yml)).
```
sudo apt-get install -y gcc make perl
sudo apt install -y openssh-server
sudo apt-get -y remove featherpad
sudo apt-get -y install geany
```

Why `exec bash`? See [here](http://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in).


# Windows

Open command line as an administrator [because Windows is stupid](https://superuser.com/questions/129299/got-not-sufficient-privileges-message-in-cmd-when-logged-on-as-administrator).

Assumes that git and Ruby is installed (not directly installable via command line as Windows is still without built-in package manager accessible from the command line). 

```
cd %HOMEPATH%\Documents
git clone https://github.com/matkoniecz/my_public_dotfiles.git
cd my_public_dotfiles
ruby install.rb
```