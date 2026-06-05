[root@stapp02 steve]# ls
[root@stapp02 steve]# sudo mkdir -p /sysops/data
[root@stapp02 steve]# sudo chown :sysops /sysops/data
[root@stapp02 steve]# sudo chmod 2770 /sysops/data
[root@stapp02 steve]# ls -ld /sysops/data
drwxrws--- 2 root sysops 4096 May 25 16:33 /sysops/data