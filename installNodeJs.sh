VERSION="${1:-25.6.1}"

if [ ! -d "/opt/node/$VERSION" ]
then
    mkdir /opt/node
    cd /opt/node
    wget https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-x64.tar.xz
    tar -xvf node-v$VERSION-linux-x64.tar.xz
    rm node-v$VERSION-linux-x64.tar.xz
    mv node-v$VERSION-linux-x64 /opt/node/$VERSION
fi 

ln -sf /opt/node/$VERSION/bin/node /usr/local/bin/nodejs
ln -sf /opt/node/$VERSION/bin/node /usr/local/bin/node
ln -sf /opt/node/$VERSION/bin/npm /usr/local/bin/npm
ln -sf /opt/node/$VERSION/bin/npx /usr/local/bin/npx

cd /usr/local/bin
ls -al nodejs node npm npx
