# CanadaRun
CanadaRun EEB
/***********************************************************/
Script fait pour MySQL WorkBench
	voir dossier JMerise
/***********************************************************/
WAMP v-host
<VirtualHost *:80>
	ServerName canadaRun.eeb.ca
	DocumentRoot "${INSTALL_DIR}/www/CanadaRun/Code/"
	RewriteEngine on
 	RewriteCond %{HTTP_HOST} ^canadaRun.eeb.ca
	RewriteCond %{REQUEST_URI} !^/public/.* [NC]	
	RewriteRule ^([a-zA-Z0-9\-\_\/\.%]*)$ /application/index.php?p=$1
	<Directory  "${INSTALL_DIR}/www/CanadaRun/Code">
		Options +Indexes +Includes +FollowSymLinks +MultiViews
		AllowOverride All
		Require local
	</Directory>
</VirtualHost>
/***********************************************************/
WINDOWS hosts
127.0.0.1 canadaRun.eeb.ca
::canadaRun.eeb.ca
/***********************************************************/
