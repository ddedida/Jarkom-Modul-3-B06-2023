apt-get update
apt-get install nginx
apt-get install apache2-utils -y

cp default /etc/nginx/sites-available/default
cp riegel.canyon.b06.com /etc/nginx/sites-available/riegel.canyon.b06.com

ln -s /etc/nginx/sites-available/riegel.canyon.b06.com /etc/nginx/sites-enabled/

mkdir /etc/nginx/rahasiakita
touch /etc/nginx/rahasiakita/.htpasswd
htpasswd -b -c /etc/nginx/rahasiakita/.htpasswd netics ajkb06

service nginx restart