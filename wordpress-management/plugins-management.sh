#!/usr/bin/env bash

#specify path to WordPress installation
WPPATH=/var/www/html/wordpress

echo "$(tput setaf 3)$(tput bold)---------------------"
echo "| PLUGINS ACTIVATED | "
echo "---------------------$(tput setaf 7)$(tput sgr0)"

#wp cli command in a variable; only active plugins
content=(`wp plugin list --path=$WPPATH --status=active --field=name --allow-root`)

#loop through array, show all the active plugins one by one
for active in "${content[@]}"
do
	echo $active
done

echo "$(tput setaf 3)$(tput bold)-----------------------"
echo "| PLUGINS DEACTIVATED | "
echo "-----------------------$(tput setaf 7)$(tput sgr0)"

#wp cli command in a variable; only inactive plugins
content=(`wp plugin list --path=$WPPATH --status=inactive --field=name --allow-root`)

for inactive in "${content[@]}"
do
	echo $inactive
done

echo "$(tput setaf 3)$(tput bold)--------------------------------"
echo "| DEACTIVATING ALL THE PLUGINS | "
echo "--------------------------------$(tput setaf 7)$(tput sgr0)"

#deactivate all the plugins
wp plugin deactivate --all --path=$WPPATH --allow-root

echo "$(tput setaf 3)$(tput bold)----------------------------------"
echo "| ACTIVATING WOOCOMMERCE PLUGINS | "
echo "----------------------------------$(tput setaf 7)$(tput sgr0)"

#array that contains woocommerce plugins (static)
WPPLUGINSWOO=( woocommerce woocommerce-admin woocommerce-germanized woocommerce-gateway-stripe woocommerce-gateway-paypal-express-checkout woocommerce-services )

#loop through array, activate woocommerce plugins
for WPPLUGINWOO in "${WPPLUGINSWOO[@]}";
do
	echo "Activating plugin $(tput setaf 2)$WPPLUGINWOO...$(tput setaf 7)"
	#activate all woocommerce plugins
	wp plugin activate $WPPLUGINWOO --path=$WPPATH --allow-root
done

echo "$(tput setaf 3)$(tput bold)------------------------------------------$(tput sgr0)$(tput setaf 7)"

#wp cli command in a variable; only active plugins
content=(`wp plugin list --path=$WPPATH --status=inactive --field=name --allow-root`)

#loop for deactivate plugins
for inactive in "${content[@]}"
do
	#activate general plugins one by one
        read -p "$(tput setaf 6)->$(tput setaf 7) Plugin $(tput setaf 2)$inactive$(tput setaf 7) is not activated, do you want to activate? (y/n) " answer
        if [ $answer == "y" ]; then
                echo "Activating plugin $(tput setaf 3)$WPPLUGIN...$(tput setaf 7)"
                wp plugin activate $inactive --path=$WPPATH --allow-root
        fi
done
