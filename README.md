# wordpress_installer

Tired of manually uploading ftp files to a server (because it's rocket science for most people...) and following the "Programming Motherf**r" cult, I quickly coded this simble bash script for installing a wordpress remotely, configuring the database in the progress. The external dependencies are:

* wget
* sed (who the hell doesn't have sed installed?)
* lftp

For now it only installs the latest version in english. I will try to be able to manage multiple versions/languages.

The command line options are:

* -v|--wp_version _not implemented_
* -l|--wp_lang _not implemented_
* -F|--ftp_path _not implemented_
* -f|--ftp_host
* -u|--ftp_user
* -p|--ftp_password
* -P|--ftp_port
* -h|--db_host
* -n|--db_name
* -a|--db_user
* -w|--db_pass
* -k|--db_prefix _not implemented_
* -y|--db_port _not implemented_

An usage example:

./install_wp.sh  -f my.awesome.webserver.com -u ftpusername -p ftpp455w0rd -h localhost -n wordpress -a wordpress -w b3t73rCh4ngeTh15


Will code for beer.