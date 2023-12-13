#!/bin/bash

cd courier-service && mvn clean install && cd -
cd discount-service && mvn clean install && cd -
cd product-service && mvn clean install && cd -