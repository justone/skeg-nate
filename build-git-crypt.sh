#!/bin/bash

cd /root
git clone https://github.com/AGWA/git-crypt.git
cd git-crypt
CXXFLAGS='-DOPENSSL_API_COMPAT=0x30000000L' make
CXXFLAGS='-DOPENSSL_API_COMPAT=0x30000000L' make install
cd ..
rm -rf git-crypt
