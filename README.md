Apply my git config to a new computer and test whatever it works:

```
echo "alias g='git'" >> ~/.bashrc
git clone https://github.com/matkoniecz/my_git_config.git
cd my_git_config
bash replace_system_settings_by_version_from_repo.sh
exec bash # http://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in
g ll
```

