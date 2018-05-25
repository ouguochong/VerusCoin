#!/bin/bash

./zcutil/build-win.sh -j2
rm -rf agama || sudo rm -rf agama || echo "No clean needed"
git clone https://github.com/asherda/agama --recursive --branch dev --single-branch || true
cd agama
./binary_artifacts.sh || true
npm install electron-packager -g || sudo npm install electron-packager -g
npm install electron -g --unsafe-perm=true || sudo npm install electron -g --unsafe-perm=true
cd gui
rm -rf EasyDEX-GUI
git clone -b dev --single-branch https://github.com/VerusCoin/EasyDEX-GUI.git || true
cd EasyDEX-GUI
npm install && npm install webpack webpack-dashboard
cd react
npm install
npm run build
cd ../../..
npm install webpack
ls
cd ..
yes | cp -rf /src/{komodod.exe,komodo-cli.exe,komodo-tx.exe} agama/assets/bin/win64
cd agama
npm install
electron-packager . --platform=win32 --arch=x64 --icon=assets/icons/agama_icons/agama_app_icon.ico --out=build/ --buildVersion=0.3 --ignore=assets/bin/osx --ignore=assets/bin/linux64 --overwrite
cd build
zip -r Agama-Win.zip Agama-win32-x64/


