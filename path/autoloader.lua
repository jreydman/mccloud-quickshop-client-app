
os.execute('rm -r /home/libs')

os.execute('mkdir /home/libs/AdapterHelper')
os.execute('wget -f https://raw.githubusercontent.com/SanyaRamzik/cw_quickShopClient/main/libs/AdapterHelper/AdapterHelper.lua?token=ASO7RFYRDGSF3KVCXELQDJ3ABRNGY /home/libs/AdapterHelper/AdapterHelper.lua')

os.execute('mkdir /home/libs/LuaHelper')
os.execute('wget -f https://raw.githubusercontent.com/SanyaRamzik/cw_quickShopClient/main/libs/LuaHelper/LuaHelper.lua?token=ASO7RF47IDJYYXMQUR4FTRDABRNIK /home/libs/LuaHelper/LuaHelper.lua')

os.execute('mkdir /home/libs/ShopProxy')
os.execute('wget -f https://raw.githubusercontent.com/SanyaRamzik/cw_quickShopClient/main/libs/ShopProxy/ShopItem.lua?token=ASO7RFZ3S7DKSN4ZTLSOV5LABRNO4 /home/libs/ShopProxy/ShopItem.lua')
os.execute('wget -f https://raw.githubusercontent.com/SanyaRamzik/cw_quickShopClient/main/libs/ShopProxy/ShopProxy.lua?token=ASO7RF2EL55CALSP734FFP3ABRNTO /home/libs/ShopProxy/ShopProxy.lua')

os.execute('mkdir /home/libs/ShopUser')
os.execute('wget -f https://raw.githubusercontent.com/SanyaRamzik/cw_quickShopClient/main/libs/ShopUser/ShopUser.lua?token=ASO7RF4IITY6CHJWH5CVXW3ABRNWK /home/libs/ShopUser/ShopUser.lua')
