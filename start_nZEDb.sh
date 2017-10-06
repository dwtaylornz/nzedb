# Start nZDEDb

echo ""
echo "--- Start nZEDb ---"   
echo ""
echo "  _____                 ____  "
echo " |   __|_ _ ___ ___ ___|    \ "
echo " |__   | | | . | -_|  _|  |  |"
echo " |_____|___|  _|___|_| |____/ "
echo "           |_|                "
echo ""            

service mysql start
service apache2 start
tail -F /var/log/apache2/error.log
