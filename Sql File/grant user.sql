create user 'rostech'@'localhost' identified by 'password';
grant all on rostech.* to 'rostech'@'localhost';

ALTER USER 'rostech'@'localhost' IDENTIFIED BY 'password';