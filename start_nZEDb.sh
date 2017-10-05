# Start nZDEDb

echo ""
echo "--- Start nZEDb ---"   
echo ""
echo -e "  _____                 ____  "
echo " |   __|_ _ ___ ___ ___|    \ "
echo " |__   | | | . | -_|  _|  |  |"
echo " |_____|___|  _|___|_| |____/ "
echo -e  "           |_|                "
echo ""            

service mysql start
service apache2 start
tail -F /install_nZEDb.sh
