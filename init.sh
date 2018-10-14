#!/bin/bash
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install aptitude

sudo apt-get -y install libstdc++6

git clone https://github.com/SDChain/SDChain-Core.git
cd SDChain-Core
git checkout `git rev-list -n 1 --before="2018-10-10" master`
cd bin
tar xvzf sdchaind-v0.3.7.tar.gz
cd sdchaind-v0.3.7

chmod 755 libprotobuf.so.8
sudo cp libprotobuf.so.8 /usr/lib/x86_64-linux-gnu/libprotobuf.so.8
chmod 755 sdchaind
cp ../SDChain-core.cfg ./SDChain-core.cfg
cp ../validators.txt ./validators.txt
./sdchaind
