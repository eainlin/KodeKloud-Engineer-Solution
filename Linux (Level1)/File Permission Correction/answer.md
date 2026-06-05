```
setfacl -m u:john:--- /etc/hostname
setfacl -m u:ryan:r-- /etc/hostname
getfacl /etc/hostname
```