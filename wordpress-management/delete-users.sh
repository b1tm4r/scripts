#!/usr/bin/env bash

#delete editor users
echo "$(tput setaf 3)$(tput bold)-------------------------"
echo "| DELETING EDITOR USERS | "
echo "-------------------------$(tput setaf 7)$(tput sgr0)"
wp user delete $(wp user list --role=editor --field=ID --path=/var/www/html/wordpress --allow-root) --path=/var/www/html/wordpress --allow-root --yes

#delete author users
echo "$(tput setaf 3)$(tput bold)-------------------------"
echo "| DELETING AUTHOR USERS | "
echo "-------------------------$(tput setaf 7)$(tput sgr0)"

wp user delete $(wp user list --role=author --field=ID --path=/var/www/html/wordpress --allow-root) --path=/var/www/html/wordpress --allow-root --yes

#delete contributor users
echo "$(tput setaf 3)$(tput bold)------------------------------"
echo "| DELETING CONTRIBUTOR USERS | "
echo "------------------------------$(tput setaf 7)$(tput sgr0)"
wp user delete $(wp user list --role=contributor --field=ID --path=/var/www/html/wordpress --allow-root) --path=/var/www/html/wordpress --allow-root --yes

#delete subscriber users
echo "$(tput setaf 3)$(tput bold)-----------------------------"
echo "| DELETING SUBSCRIBER USERS | "
echo "-----------------------------$(tput setaf 7)$(tput sgr0)"
wp user delete $(wp user list --role=subscriber --field=ID --path=/var/www/html/wordpress --allow-root) --path=/var/www/html/wordpress --allow-root --yes

#delete customer users
echo "$(tput setaf 3)$(tput bold)-----------------------------"
echo "| DELETING CUSTOMER USERS | "
echo "-----------------------------$(tput setaf 7)$(tput sgr0)"
wp user delete $(wp user list --role=customer --field=ID --path=/var/www/html/wordpress --allow-root) --path=/var/www/html/wordpress --allow-root --yes

#clean and remove all orders
echo "$(tput setaf 3)$(tput bold)-----------------------"
echo "| REMOVING ALL ORDERS | "
echo "-----------------------$(tput setaf 7)$(tput sgr0)"
wp post delete $(wp post list --field=ID --post_type="shop_order" --path=/var/www/html/wordpress --allow-root) --path=/var/www/html/wordpress --allow-root --force
