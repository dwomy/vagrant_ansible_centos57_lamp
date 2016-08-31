<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /vagrant/www/

  <Directory />
          Options Indexes FollowSymLinks Includes ExecCGI
          AllowOverride ALL
  </Directory>


  <Directory /vagrant/www/>
    Options Indexes FollowSymLinks Includes ExecCGI
    AllowOverride All
#    Require all granted
    Order allow,deny
    Allow from all
  </Directory>

  ErrorLog "/var/log/httpd/html-error_log"
  CustomLog "/var/log/httpd/html-access_log" common
</VirtualHost>