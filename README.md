Apply my git config to a new computer and test whatever it works:

```
git clone https://github.com/matkoniecz/my_public_dotfiles.git
cd my_public_dotfiles
ruby install.rb
exec bash
g ll
```

Why `exec bash`? See http://stackoverflow.com/questions/2518127/how-do-i-reload-bashrc-without-logging-out-and-back-in


# Windows

Open command line as an administrator [because Windows is stupid](https://superuser.com/questions/129299/got-not-sufficient-privileges-message-in-cmd-when-logged-on-as-administrator)

```
cd %HOMEPATH%\Documents
git clone https://github.com/matkoniecz/my_public_dotfiles.git
cd my_public_dotfiles
ruby install.rb
```