#!/usr/bin/env bash

#define array of plugin slugs to install
WPPLUGINS=( wordpress-seo )

#specify path to WordPress installation
WPPATH=/var/www/html/wordpress

#loop through array, install and activate the plugin, ${WPPLUGINS[@]}
for WPPLUGIN in "${WPPLUGINS[@]}"; do
#check if plugin is installed, sets exit status to 1 if not found
    wp plugin is-installed $WPPLUGIN --path=$WPPATH --allow-root

#install plugin if not present based on exit code value
    if [ $? -eq 1 ]; then
	echo "Plugin $WPPLUGIN is not installed, installing and activating"
        wp plugin install $WPPLUGIN --activate --path=$WPPATH --allow-root
    else
	echo "Plugin $WPPLUGIN already installed, updating..." 
	wp plugin update $WPPLUGIN --path=$WPPATH --allow-root
    fi
done
echo "-----------------------------------------------"
#update woocommerce plugins
echo "Updating WooCommerce plugins"
#array of woocommerce plugins
WPPLUGINSWOO=( woocommerce woocommerce-admin  )

for WPPLUGINSWOO in "${WPPLUGINSWOO[@]}"; do
#check if plugin is installed, sets exit status to 1 if not found
    wp plugin is-installed $WPPLUGINSWOO --path=$WPPATH --allow-root

#install plugin if not present based on exit code value
    if [ $? -eq 1 ]; then
        echo "Plugin $WPPLUGINSWOO is not installed, installing and activating"
        wp plugin install $WPPLUGINSWOO --activate --path=$WPPATH --allow-root
    else
        echo "Plugin $WPPLUGINSWOO already installed, updating..." 
        wp plugin update $WPPLUGINSWOO --path=$WPPATH --allow-root
    fi
done

#Fix permissions in case you run as root
sudo chown -R www-data:www-data $WPPATH
sudo find $WPPATH -type f -exec chmod 644 {} +
sudo find $WPPATH -type d -exec chmod 755 {} +
