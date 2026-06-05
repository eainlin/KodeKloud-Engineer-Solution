```
cat /root/nautilus.xml | grep Sample
sed -i 's/Sample/Echo-Location/g' /root/nautilus.xml
cat /root/nautilus.xml | grep Echo-Location
```