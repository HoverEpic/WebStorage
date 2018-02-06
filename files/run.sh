#! /bin/ash
sed -i "s/:100:101:apache:/:$APACHE_UID:$APACHE_GID:apache:/g" /etc/passwd
sed -i "s/:101:apache/:$APACHE_GID:apache/g" /etc/group

chown -R apache:apache /run/apache2

# Upload dir setup
if [[ -n "$UPLOAD_DIR" ]]; then
    mkdir -p $UPLOAD_DIR
	chmod +wr $UPLOAD_DIR
    echo "Upload dir $UPLOAD_DIR configured."
fi

# Security setup
if [[ -z "$STORAGE_USER" && -z "$STORAGE_PASS" ]]; then
    echo "No auth configured."
else
    htpasswd -dbc /var/www/.htpasswd $STORAGE_USER $STORAGE_PASS
    echo "AuthType Basic configured."
fi

chown -R apache:apache /var/www/

exec /usr/sbin/httpd -DFOREGROUND;
