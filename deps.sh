# Install gphoto2 used to control the camera
apt-get update
apt-get install -y gphoto2

# Install quick2wire-gpio-admin needed by pi-gpio
git clone --depth=1 git://github.com/quick2wire/quick2wire-gpio-admin.git
cd quick2wire-gpio-admin
make && make install
