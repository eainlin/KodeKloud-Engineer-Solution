sudo vi /etc/security/limits.conf
nfsuser      soft    nproc          1025
nfsuser      hard    nproc          2025

sudo su - nfsuser
# Check the soft limit for maximum processes
ulimit -Su

# Check the hard limit for maximum processes
ulimit -Hu