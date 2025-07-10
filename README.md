To apply config to a new computer and test whether it works by runnning `g ll` (readable git log):

```
sudo apt-get install -y ruby git python3
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
In VirtualBox install also what Guest Additions need + SSH support. For Lubuntu replacing `featherpad` with something more useful as a code editor is a good idea (see a [longer discussion in my full ansible setup](https://github.com/matkoniecz/recovery-with-ansible/blob/master/roles/code_editor_generic_for_everything/tasks/main.yml)). Also, remove browser to avoid distractions.
```
sudo apt-get install -y gcc make perl
sudo apt install -y openssh-server
sudo apt-get -y remove featherpad
sudo apt-get -y install geany
sudo apt-get -y remove firefox
sudo rm /etc/xdg/autostart/upg-notifier-autostart.desktop # gets rid of demonic "Upgrade Notifier" popup
echo "mode:           off" > ~/.xscreensaver
```

Why `exec bash`? See [here](http://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in).
