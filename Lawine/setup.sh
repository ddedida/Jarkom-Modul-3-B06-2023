apt-get update
apt-get install nginx php php-fpm -y
apt-get install wget
apt-get install unzip

wget -O php-granz-channel.zip "https://drive.google.com/uc?export=download&id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1"
unzip php-granz-channel.zip
rm -r php-granz-channel.zip

mkdir /var/www/granz.channel.b06
cp -R modul-3/. /var/www/granz.channel.b06/
cp granz.channel.b06 /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/granz.channel.b06 /etc/nginx/sites-enabled

rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default

service nginx restart
service php7.3-fpm start