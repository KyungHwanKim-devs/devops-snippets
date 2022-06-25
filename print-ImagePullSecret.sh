#!/usr/bin/env sh

kubectl create secret docker-registry regcred
--docker-server=594311320189.dkr.ecr.ap-northeast-2.amazonaws.com
--docker-username=AWS
--docker-password=$(aws ecr get-login-password)
--namespace=