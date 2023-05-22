  
### install dovecot-pop3d

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install dovecot-pop3d
nano /etc/dovecot/dovecot.conf
```

`add: `protocols = pop3

`add: `mail_location = maildir:~/Maildir

```bash
sudo systemctl start dovecot
sudo systemctl enable dovecot
```

### FireWall

```bash
  sudo ufw status verbose
```

### install postfix

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postfix
sudo nano /etc/postfix/main.cf
```

### port

```bash
ss
ss | grep --color=always -E "25"
ss | grep --color=always -E "mail"
ss -a  | grep --color=always -E "mail"
```

### install mailutils

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install mailutils
```

### send mail

```bash
mkdir -p ~/Maildir/{cur,new,tmp}
chmod -R 700 ~/Maildir
echo "This is the body of the email" | mail -s "This is the subject line" test@test.com
```
```bash
mail -s "This is the subject line" test@test.com
```
