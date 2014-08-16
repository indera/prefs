prefs
=====

store uesful config files

Using SSH keys
== 

* Generate private/public keys
<pre>
 $ ssh-keygen -t rsa -C "your_email@example.com"
 $ eval "$(ssh-agent -s)"
 $ ssh-add ~/.ssh/id_rsa
</pre>

* Copy the key to the github account
<pre>
$ pbcopy < ~/.ssh/id_rsa.pub
</pre>

* Configure ~/.ssh/config

<pre>
Host github-as-indera
    HostName github.com
    User git
    IdentityFile /home/asura/.ssh/id_rsa
    IdentitiesOnly yes
</pre>

* Swith the remote urls from https(default) to ssh so the keys can be used
  cd ~/git/prefs
  git remote set-url origin git@github.com:indera/prefs.git
