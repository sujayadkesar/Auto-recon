#! /bin/bash

sudo apt-get update -y
#whatweb
sudo apt-get install whatweb -y


# wafw00f
mkdir ${HOME}/Desktop/toolkit
cd ${HOME}/Desktop/toolkit
git clone https://github.com/enablesecurity/wafw00f.git
cd wafw00f
sudo chmod +x setup.py
python3 setup.py install


# theHarvester
cd ${HOME}/Desktop/toolkit
git clone https://github.com/AlexisAhmed/theHarvester.git
cd theHarvester
python3 -m pip install -r requirements.txt
sudo chmod +x theHarvester.py
ln -sf ${HOME}/Desktop/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

