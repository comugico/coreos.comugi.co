#!/bin/bash
cd $(dirname $0)

pushd ./aipo
docker build --tag="aipo" .
docker run -d --name="aipo" aipo
sudo cp ./services/aipo.service /etc/systemd/system/
sudo systemctl enable aipo.service
sudo systemctl restart aipo.service
popd

pushd ./aipo2
docker build --tag="aipo2" .
docker run -d --name="aipo2" aipo2
sudo cp ./services/aipo2.service /etc/systemd/system/
sudo systemctl enable aipo2.service
sudo systemctl restart aipo2.service
popd

pushd ./reverseproxy
docker build --tag="reverseproxy" .
docker run -d --name="reverseproxy" --link aipo:aipo --link aipo2:aipo2 -p 80:80 reverseproxy
sudo cp ./services/reverseproxy.service /etc/systemd/system/
sudo systemctl enable reverseproxy.service
sudo systemctl restart reverseproxy.service
popd