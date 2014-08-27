#!/bin/bash
cd $(dirname $0)

pushd ./aipo
docker build --tag="aipo" .
docker -d --name="aipo" aipo
popd

pushd ./aipo2
docker build --tag="aipo2" .
docker -d --name="aipo2" aipo2
popd

pushd ./reverseproxy
docker build --tag="reverseproxy" .
docker -d --name="reverseproxy" --link aipo:aipo --link aipo2:aipo2 -p 80:80 reverseproxy
popd