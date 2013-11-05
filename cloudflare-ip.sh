#!/usr/bin/env bash 
# we will gonna use different method for finding real I.P. behind cloudflare 
# subdoimain=mail,forum,direct,direct-connect,ftp,cpanel,blog,dev,m,support,webmail,ssl,record,dns,help
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

echo -e " $COL_RED 
  ____   _____     ____  _____ ____   ___  _ __     _______ ____  
 / ___| |  ___|   |  _ \| ____/ ___| / _ \| |\ \   / / ____|  _ \ 
| |     | |_ _____| |_) |  _| \___ \| | | | | \ \ / /|  _| | |_) |
| |___ _|  _|_____|  _ <| |___ ___) | |_| | |__\ V / | |___|  _ < 
 \____(_)_|       |_| \_\_____|____/ \___/|_____\_/  |_____|_| \_\

$COL_RESET                                                                  
"

echo -e " $COL_RED Please ENTER website name without http. For example tipstrickshack.blogspot.com $COL_RESET"

read var1

echo -e " 
$COL_YELLOW Please choose methods

(1) DNS bruteforce (Outpt saved into out.txt file)

(2) NMAP

(3)Netcraft Toolbar
$COL_RESET"
read m1

if [ "$m1" = "1" ];then

echo -e " $COL_BLUE
mail,forum,direct,direct-connect,ftp,cpanel,blog,dev,m,support,webmail,ssl,record,dns,help will checked for possible I.P. $COL_RESET
"
out1=$( (resolveip -s $var1) 2>&1 )
dns=198.61.167.32 

# i used dns variable , because for unknown DNS my isp redirect to  its address
#so we can know that response is vaild or not.


if [ "$out1" == "$dns" ];then
	echo "$var1 NOT FOUND. PLEASE ENTER CORRECT DOMAIN."
else
	echo "$var1 ip is $out1" >> out.txt
fi


out2=$( (resolveip -s mail.$var1) 2>&1 )
if [ "$out2" == "$dns" ];then
	echo "mail.$var1 NOT FOUND."
else
	echo "mail.$var1 ip is $out2" >> out.txt
fi

out3=$( (resolveip -s forum.$var1) 2>&1 )
if [ "$out3" == "$dns" ];then
	echo "forum.$var1 NOT FOUND."
else
	echo "forum.$var1 ip is $out3" >> out.txt
fi

out4=$( (resolveip -s direct.$var1) 2>&1 )
if [ "$out4" == "$dns" ];then
	echo "direct.$var1 NOT FOUND."
else
	echo "direct.$var1 ip is $out4" >> out.txt
fi

out5=$( (resolveip -s direct-connect.$var1) 2>&1 )
if [ "$out5" == "$dns" ];then
	echo "direct-connect.$var1 NOT FOUND."
else
	echo "direct-connect.$var1 ip is $out5" >> out.txt
fi

out6=$( (resolveip -s ftp.$var1) 2>&1 )
if [ "$out6" == "$dns" ];then
	echo "ftp.$var1 NOT FOUND."
else
	echo "ftp.$var1  ip is $out6" >> out.txt
fi

out7=$( (resolveip -s cpanel.$var1) 2>&1 )
if [ "$out7" == "$dns" ];then
	echo "cpanel.$var1 NOT FOUND."
else
	echo "cpanel.$var1  ip is $out7" >> out.txt
fi

out8=$( (resolveip -s blog.$var1) 2>&1)
if [ "$out8" == "$dns" ];then
	echo "blog.$var1 NOT FOUND."
else
	echo "blog.$var1 ip is $out8" >> out.txt
fi

out9=$( (resolveip -s dev.$var1) 2>&1 )
if [ "$out9" == "$dns" ];then
	echo "dev.$var1 NOT FOUND."
else
	echo "dev.$var1 ip is $out9" >> out.txt
fi

out10=$( (resolveip -s m.$var1) 2>&1)
if [ "$out10" == "$dns" ];then
	echo "m.$var1 NOT FOUND."
else
	echo "m.$var1 ip is $out10" >> out.txt
fi

out11=$( (resolveip -s support.$var1) 2>&1)
if [ "$out11" == "$dns" ];then
	echo "support.$var1 NOT FOUND."
else
	echo "support.$var1 ip is $out11" >> out.txt
fi

out12=$( (resolveip -s ssl.$var1) 2>&1)
if [ "$out12" == "$dns" ];then
	echo "ssl.$var1 NOT FOUND."
else
	echo "ssl.$var1 ip is $out12" >> out.txt
fi

out13=$( (resolveip -s webmail.$var1) 2>&1)
if [ "$out13" == "$dns" ];then
	echo "webmail.$var1 NOT FOUND."
else
	echo "webmail.$var1 ip is $out13" >> out.txt
fi

out14=$( (resolveip -s dns.$var1) 2>&1 )
if [ "$out14" == "$dns" ];then
	echo "dns.$var1 NOT FOUND."
else
	echo "dns.$var1 ip is $out14" >> out.txt
fi

out15=$( (resolveip -s www.$var1) 2>&1 )
if [ "$out16" == "$dns" ];then
	echo "www.$var1 NOT FOUND."
else
	echo "www.$var1 ip is $out15" >> out.txt
fi

out16=$( (resolveip -s help.$var1) 2>&1 )
if [ "$out16" == "$dns" ];then
	echo "help.$var1 NOT FOUND."
else
	echo "help.$var1 ip is $out16" >> out.txt
fi

echo -e "
 $COL_RED
Please Open out.txt file for possible I.P. $COL_RESET"
fi

if [ "$m1" = "2" ];then
nmap --script dns-brute -sn $var1
fi

if [ "$m1" = "3" ];then
echo -e "$COL_CYAN View new open window in firefox & then view Hosting History $COL_RESET"
firefox http://toolbar.netcraft.com/site_report?url=$var1
fi
