# défi santé EEB
/***********************************************************/
Script fait pour MySQL WorkBench
	voir dossier JMerise
/***********************************************************/
WAMP v-host
<VirtualHost *:80>
	ServerName defisante.eeb.ca
	DocumentRoot "${INSTALL_DIR}/www/DefiSanteEEB/Code/"
	RewriteEngine on
 	RewriteCond %{HTTP_HOST} ^defisante.eeb.ca
	RewriteCond %{REQUEST_URI} !^/public/.* [NC]	
	RewriteRule ^([a-zA-Z0-9\-\_\/\.%]*)$ /application/index.php?p=$1
	<Directory  "${INSTALL_DIR}/www/DefiSanteEEB/Code">
		Options +Indexes +Includes +FollowSymLinks +MultiViews
		AllowOverride All
		Require local
	</Directory>
</VirtualHost>
/***********************************************************/
WINDOWS hosts
127.0.0.1 defisante.eeb.ca
::defisante.eeb.ca
/***********************************************************/
