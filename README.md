# i2c
revitalised I2C project 
Sun 13 Nov 2016 23:00:14 AEDT 
work through dmesg

sudo apt-get install lm-sensors
sudo sensors-detect 

run code on laptop with vga cable plugged into experimental hardware
VGA cable should run at 5V - check this

#
look through dmesg2.txt for i2c, radeon
look throu	i2cdetect...
Sun 13 Nov 2016 23:38:22 AEDT 
boot with no remote display ; then plug in the display and exec i2cdect  -y 7 and look for devices 

