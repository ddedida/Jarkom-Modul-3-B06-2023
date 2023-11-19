CREATE USER 'kelompokb06'@'%' IDENTIFIED BY 'passwordb06';
CREATE USER 'kelompokb06'@'localhost' IDENTIFIED BY 'passwordb06';
CREATE DATABASE dbkelompokb06;
GRANT ALL PRIVILEGES ON *.* TO 'kelompokb06'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'kelompokb06'@'localhost';
FLUSH PRIVILEGES;