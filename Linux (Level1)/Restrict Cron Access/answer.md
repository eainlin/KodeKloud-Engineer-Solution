``` sh
vi /etc/cron.allow  # add >> mariyam

vi /etc/cron.deny  # add >> ryan

sudo -u mariyam crontab -l

sudo -u ryan crontab -l

```