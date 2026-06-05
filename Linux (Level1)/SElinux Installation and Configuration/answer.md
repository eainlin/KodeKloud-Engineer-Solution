### SElinux Installaiont and Configuration
### Install the selinux package on redhat 

```sh
yum install -y selinux-policy selinux-policy-targeted policycoreutils
```

### Permanently Disable SELinux
```sh
vi /etc/selinux/config

## Change the following command
SELINUX=disabled
```
### Verify the Configuration
```sh
cat /etc/selinux/config | grep ^SELINUX=
```
