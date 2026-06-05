    1  cat /etc/passwd | grep jarod
    2  groupadd nautilus_noc
    3  useradd jarod -m 
    4  usermod -aG nautilus_noc jarod
    5  cat /etc/passwd | grep jarod
    6  id jarod