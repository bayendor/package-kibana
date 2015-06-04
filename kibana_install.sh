sudo su -

cd ~; wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz

# Make deb package from tar file
fpm -s dir -t deb --prefix /opt/kibana -n kibana -v 4.0.2 kibana-4.0.2-linux-x64.tar.gz

tar xvf kibana-*.tar.gz

mkdir -p /opt/kibana

cp -R ~/kibana-4*/* /opt/kibana/

# cd /etc/init.d && # get kibana4 init script

cd /etc/init.d && cp ~/kibana4 $PWD/kibana4

chmod +x /etc/init.d/kibana4

update-rc.d kibana4 defaults 96 9

service kibana4 start
