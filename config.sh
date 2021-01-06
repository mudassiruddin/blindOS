# Getting the requirmets 
if ! command -v apt-get &> /dev/null
then
    echo "[Error] You dont have apt-get installed"
    exit
else
	if ! command -v xclip &> /dev/null
	then
		echo "[Error] xclip is not installed"
		echo "Do you want to install xclip (yes/no)? : "
		read option
		case "$option" in
			[yY] | [yY][eE][sS])echo "[+] Installing xclip"
					   apt-get update -y
					   sudo apt-get install -y xclip;;

			[nN] | [nN][oO])echo "[!] xclip not installed"
			     		echo "[Error] xclip is required to run blindOS"
					exit;;

			*) echo "[Error] wrong option seleted"
				exit;;
		esac
	fi

fi

# making executable
echo "[+] Making file executable"
chmod +x blindOS

# Making script into path
echo "Do you want to add blindOS in your path (yes/no)?: "
read path

case "$path" in
    [yY] | [yY][eE][sS]) echo "[+] Adding blindOS to path"
			echo "[+] Copying the binary to path"
			cp ./blindOS /usr/bin/blindOS
			 echo "[+] blindOS added to path" ;;

    [nN] | [nN][oO]) echo "[-] File not added to path";;

    *) echo "[Error] wrong option seleted";;
esac

