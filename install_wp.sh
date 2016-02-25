#!/bin/bash

WP_VERSION='latest'
WP_LANG=''
WP_DOWNLOAD_URL='http://wordpress.org'

WP_TEMPLATE_CONFIG_FILE='./tmp/wordpress/wp-config-sample.php'
WP_FINAL_CONFIG_FILE='./tmp/wordpress/wp-config.php'


FTP_PATH=''
FTP_HOST=''
FTP_USER=''
FTP_PASSWORD=''
FTP_PORT='21'

DB_HOST='localhost'
DB_NAME='wordpress'
DB_USER='wordpress'
DB_PASS=''
DB_PREFIX='wp_'
DB_PORT='3306'

while [[ $# > 1 ]]
do
key="$1"

case $key in
    -v|--wp_version)
    WP_VERSION="$2"
    shift # past argument
    ;;
    -l|--wp_lang)
    WP_LANG="$2"
    shift # past argument
    ;;
    
    -F|--ftp_path)
    FTP_PATH="$2"
    shift # past argument
    ;;
    -f|--ftp_host)
    FTP_HOST="$2"
    shift # past argument
    ;;
    -u|--ftp_user)
    FTP_USER="$2"
    shift # past argument
    ;;
    -p|--ftp_password)
    FTP_PASSWORD="$2"
    shift # past argument
    ;;
    -P|--ftp_port)
    FTP_PORT="$2"
    shift # past argument
    ;;
    
    -h|--db_host)
    DB_HOST="$2"
    shift # past argument
    ;;
    -n|--db_name)
    DB_NAME="$2"
    shift # past argument
    ;;
    -a|--db_user)
    DB_USER="$2"
    shift # past argument
    ;;
    -w|--db_pass)
    DB_PASS="$2"
    shift # past argument
    ;;
    -k|--db_prefix)
    DB_PREFIX="$2"
    shift # past argument
    ;;
    -y|--db_port)
    DB_PORT="$2"
    shift # past argument
    ;;
    
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

rm -Rf ./tmp
mkdir ./tmp
wget -O ./tmp/wordpress.tar.gz $WP_DOWNLOAD_URL/$WP_VERSION.tar.gz
tar xvfz ./tmp/wordpress.tar.gz -C ./tmp
cat $WP_TEMPLATE_CONFIG_FILE | sed -e 's|database_name_here|'$DB_NAME'|g' | sed -e 's|username_here|'$DB_USER'| g' | sed -e 's|password_here|'$FTP_PASSWORD'|g' | sed -e 's|localhost|'$DB_HOST'|g'  > $WP_FINAL_CONFIG_FILE

lftp -u $FTP_USER,$FTP_PASSWORD -e "mirror -R ./tmp/wordpress/ ." $FTP_HOST;
        
rm -Rf ./tmp
