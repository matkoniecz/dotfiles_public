Apply my git config to a new computer and test whatever it works:

```
git clone https://github.com/matkoniecz/my_git_config.git
cd my_git_config
echo "alias g='git'" >> ~/.bashrc
bash create_soft_links.sh
exec bash # http://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in
g ll

# following is typically useful on disposable VMs
sudo su
echo "alias g='git'" >> ~/.bashrc
exec bash
g ll
```

