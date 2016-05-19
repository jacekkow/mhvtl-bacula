# install mhvtl
cd /usr/src/
git clone https://github.com/markh794/mhvtl.git 
make distclean
cd mhvtl/kernel/
make && make install
cd ..
make && make install
chkconfig --add mhvtl
chkconfig mhvtl on

# install mhvtl-gui
yum install -y httpd php sudo sysstat
cp /etc/sudoers /etc/sudoers.old
sed -i '/Defaults    requiretty/s/^/#/' /etc/sudoers
echo "apache ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo ln -s /usr/lib/libvtlscsi.so /usr/lib64/
sudo ln -s /usr/lib/libvtlcart.so /usr/lib64/

chkconfig httpd on
cd /var/www/html
git clone https://github.com/walterfrs/mhvtl-gui.git
chown -R apache:apache ./
service httpd start 
