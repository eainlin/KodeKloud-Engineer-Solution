```sh

# For the app server 1
scp /home/thor/nautilus_banner tony@stapp01:/tmp/
ssh -t tony@stapp01 "sudo cp /tmp/nautilus_banner /etc/motd && rm /tmp/nautilus_banner"

# For the app server 02
scp /home/thor/nautilus_banner steve@stapp02:/tmp/
ssh -t steve@stapp02 "sudo cp /tmp/nautilus_banner /etc/motd && rm /tmp/nautilus_banner"

# For the app server 03
scp /home/thor/nautilus_banner banner@stapp03:/tmp/
ssh -t banner@stapp03 "sudo cp /tmp/nautilus_banner /etc/motd && rm /tmp/nautilus_banner"
