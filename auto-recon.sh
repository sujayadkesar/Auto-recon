#! /bin/bash

<<color_chart
Black        0;30     Dark Gray     1;30
Red          0;31     Light Red     1;31
Green        0;32     Light Green   1;32
Brown/Orange 0;33     Yellow        1;33
Blue         0;34     Light Blue    1;34
Purple       0;35     Light Purple  1;35
Cyan         0;36     Light Cyan    1;36
Light Gray   0;37     White         1;37

example 
red='\033[0;31m'
echo -e "${red}this will be in red"
https://en.wikipedia.org/wiki/ANSI_escape_code
color_chart


red='\e[31m'
green='\e[32m'
BLK='\e[30m'; blk='\e[90m'; BBLK='\e[40m'; bblk='\e[100m' #| Black   |
RED='\e[31m'; red='\e[91m'; BRED='\e[41m'; bred='\e[101m' #| Red     |
GRN='\e[32m'; grn='\e[92m'; BGRN='\e[42m'; bgrn='\e[102m' #| Green   |
YLW='\e[33m'; ylw='\e[93m'; BYLW='\e[43m'; bylw='\e[103m' #| Yellow  |
BLU='\e[34m'; blu='\e[94m'; BBLU='\e[44m'; bblu='\e[104m' #| Blue    |
MGN='\e[35m'; mgn='\e[95m'; BMGN='\e[45m'; bmgn='\e[105m' #| Magenta |
CYN='\e[36m'; cyn='\e[96m'; BCYN='\e[46m'; bcyn='\e[106m' #| Cyan    |
WHT='\e[37m'; wht='\e[97m'; BWHT='\e[47m'; bwht='\e[107m' #| White   |

toilet="$(which toilet)"
if  ["$toilet" != "usr/bin/toilet" ];
then
    sudo apt install toilet -y 
    clear
fi

figlet="$(which figlet)"
if [ "$figlet" != "usr/bin/toilet" ];
then
    sudo apt install figlet -y
    clear
fi


echo -e "\n"
toilet -f mono9 -F border Auto Recon
echo -e "\n"
figlet -f term "[*] sujay_adkesar: https://sujayadkesar.github.io/portfolio"
echo -e "\n\n"


printf "$RED"
figlet -f term WARNING!!  This auto recon uses all the active scan methods it may trigger the backend monitoring systems \n Use this tool at your own risk!!

echo -e "${CYN}\nEnter the target Ip-Address\n" 
read ip

cd $HOME 
cd ~/Desktop
DIR=~/Desktop/automated_testing
if [ -d "$DIR" ];
then
    cd automated_testing
    mkdir $ip
    cd $ip
else
    mkdir automated_testing
    cd automated_testing
fi


echo "Enter the number of desired recon type"
echo -e "[1] Passive Recon \n[2] Active Recon\n"
read type


nslookup_run () {
    echo -e "${YLW} ---------------Checking in nslookup---------------\n\n"
    echo -e "\n_______________________nslookup details______________________\n\n\n" > passive-recon-results.txt
    nslookup $ip >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . .\n\n"
}

host_discovery () {
    echo -e "${YLW} ------------------Host Discovery------------------\n\n"
    echo -e "\n\n\n\n ________________HOST Details_____________\n\n" >> ./passive-recon-results.txt
    host $ip >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . ."
}


dnsrecon_run () {
    echo -e "${YLW}\n\n\n--------------------DNS Recon ---------------------\n\n" 
    echo -e "\n\n\n __________________DNS Recon_________________\n\n" >> ./passive-recon-results.txt
    dnsrecon -d $ip >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . ."
}

theHarvester_run () {
    echo -e "${YLW}\n\n---------Employee-Information-gathering--------\n\n"
    echo -e "\n\n______________Employee-information-gathering__________________\n\n" >> ./passive-recon-results.txt
    theHarvester -d $ip -l 300 -b google,linkedin,github-code,twitter >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . ."
}


wafw00f_run () {
    echo -e "${YLW}\n\n\n---------Gathering Firewall Details ---------\n\n"
    echo -e "\n\n\n ________________Checking firewall details_________________\n\n" >> ./passive-recon-results.txt
    wafw00f $ip >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . ."
}


digutility_run () {
    echo -e "${YLW}\n\n\n------------Querying dig utility-------------\n\n"
    echo -e "\n\n\n ____________________Checking dig utility__________________\n\n" >> ./passive-recon-results.txt
    dig $ip >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . ."
}


whatweb_run () {
    echo -e "${YLW}\n\n\n---------------Whatweb Records---------------\n\n"
    echo -e "\n\n\n ___________________Whatweb Records______________\n\n" >> ./passive-recon-results.txt
    whatweb $ip >> ./passive-recon-results.txt
    printf "${GRN}"
    echo -ne '[|||                       ][20%]\r'
    sleep 2
    echo -ne '[|||||||                   ][40%]\r'
    sleep 1
    echo -ne '[||||||||||||||            ][60%]\r'
    sleep 1
    echo -ne '[|||||||||||||||||||||||   ][80%]\r'
    sleep 2
    echo -ne '[|||||||||||||||||||||||||][100%]\r'
    echo -ne '\n\n'
    echo -e "[*] results saved successfully . . . . .\n"
    echo -e "**************************************************************"
    printf "${CYN}"
    echo -e "\n\n[*] nslookup scanning completed successfully ...."
    echo -e "[*] Scan results are stored in automated_testing folder on Desktop\n\n"
}



#__________________________________________________________________________________________


# if ! [ -x "$(command -v git)" ];
# then
#   echo 'Error: git is not installed.' >&2
# else
#   echo 'yes go for it'
# fi




int1="1"
int2="2"

if [ "$type" = "$int1" ];
then
    nslookup="$(which nslookup)"
    if [ "$nslookup" != "/usr/bin/nslookup" ];
    then
        echo -e "nslookup not found! installing mannually"
        sudo apt install nslookup
        clear
        nslookup_run
    
    else
        nslookup_run
    fi


        
    host_check="$(which host)"
    if [ "$host_check" != "/usr/bin/host" ];
    then
        echo -e "Host not found! Installing mannually . . . \n"
        sudo apt install host 
        clear
        host_discovery
    else
        host_discovery
    fi



    dns_recon="$(which dnsrecon)"
    if [ "$dns_recon" != "/usr/bin/dnsrecon" ];
    then
        echo -e "dnsrecon not found! Installing mannually . . .\n"
        sudo apt install dnsrecon 
        clear
        dnsrecon_run
    else
        dnsrecon_run
    fi



    theharvester="$(which theHarvester)"
    if [ "$theharvester" != "/usr/bin/theHarvester" ];
    then
        echo -e "theHarvester not found! Installing mannually . . .\n"
        cd ${HOME}/Desktop/toolkit
        git clone https://github.com/AlexisAhmed/theHarvester.git
        cd theHarvester
        clear
        sudo python3 -m pip install -r requirements.txt
        sudo chmod +x theHarvester.py
        sudo ln -sf ${HOME}/Desktop/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester
        clear

        theHarvester_run 
    else
        theHarvester_run
    fi
    
    
    wafw00f="$(which wafw00f)"
    if [ "$wafw00f" != "/usr/local/bin/wafw00f" ];
    then
        echo -e "wafw00f not found! Installing mannually . . .\n"
        cd ${HOME}/Desktop/toolkit
        git clone https://github.com/enablesecurity/wafw00f.git
        clear
        cd wafw00f
        sudo chmod +x setup.py
        sudo python3 setup.py install
        clear
    
        wafw00f_run
    else
        wafw00f_run
    fi
    
    

    digutility="$(which dig)"
    if [ "$digutility" != "/usr/bin/dig" ];
    then
        echo -e "dig not found! Installing mannually . . .\n"
        sudo apt instal dig 
        clear
        digutility_run
    else
        digutility_run
    fi



    whatweb="$(which whatweb)"
    if [ "$whatweb" != "/usr/bin/whatweb" ];
    then
        echo -e "whatweb not found! Installing mannually . . .\n"
        sudo apt install whatweb
        clear
        whatweb_run
    else
        whatweb_run
    fi





    # _________________________________________________________________________________________
   



elif [ "$type" = "$int2" ];
then 
    echo -e "${YLW}\n------------------------STARTING NMAP----------------------\n\n"
    echo -e "Enter the port range\n"
    echo -e "[1] Default    {1-1000  ports }"
    echo -e "[2] All ports  {1-65535 ports}"
    read port_range
    if [ "$port_range" = "1" ];
    then
        sudo nmap -sV -sC -O $ip > nmap-scan-results.txt    
        echo -ne '${GRN}#####                     (33%)\r'
        sleep 1
        echo -ne '#############             (66%)\r'
        sleep 1
        echo -ne '#######################   (100%)\r'
        echo -ne '\n'
        echo "[*] Nmap scanning completed succesfully ...."

    elif [ "$port_range" = "2" ];
    then
        printf "$CYN"
        echo -e "[*] Note: scanning all 65535 ports it may take few minutes!!\n\n" 
        printf "$YLW"
        sudo nmap -sV -sC -p- --min-rate=5000 -O $ip > nmap-scan-results.txt   
        echo -ne '${GRN}#####                     (33%)\r'
        sleep 1
        echo -ne '#############             (66%)\r'
        sleep 1
        echo -ne '#######################   (100%)\r'
        echo -ne '\n'
        echo "[*] Nmap scanning completed succesfully ...."
    fi

        


    echo  -e "${YLW}\n------------Scanning using NMAP SCRIPT ENGINES------------\n\n"


    sudo nmap --script /usr/share/nmap/scripts/vulners.nse $ip > nmap-script-engine-results.txt

    echo -ne '${GRN}#####                     (33%)\r'
    sleep 1
    echo -ne '#############             (66%)\r'
    sleep 1
    echo -ne '#######################   (100%)\r'
    echo -ne '\n'


    echo "[*] Nmap-Script-Engine scanning completed succesfully ...."
    echo "[*] Scan results are stored in automated_testing folder on desktop"

else
    echo -e "${RED}[*] Command not found!"
fi
