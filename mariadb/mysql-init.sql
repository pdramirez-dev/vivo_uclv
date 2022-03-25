CREATE DATABASE vitrodb CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON vitrodb.* TO 'vitroadmin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON vitrodb.* TO 'vitroadmin'@'localhost' IDENTIFIED BY 'admin';
FLUSH PRIVILEGES;


