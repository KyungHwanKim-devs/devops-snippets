# devOps 공부를 위한 코드 스니펫 모음

포크 떠가서 사용할것

# Gitlab Flow

production, main(master)과 main에서 따온 feature(hotfix) 브랜치들

# 서버운영?

브랜치랑 똑같이?

# networkForEks -> 아마존 EKS을 위한 네트워크(VPC) 설정

vpc 먼저 init 후 apply

# k9s

# update-kubeconfig 에 --name=클러스터 이름으로 수정

# Kustomize

gitOps config 파일은 kustomize로 관리
patch 로 main(master), dev, production config

# CI -> Github action

Github action trigger -> dockerfile build on github action -> push on ecr -> push gitOps config

# CD -> ArgoCD

워커노드 띄운후 가장먼저 설치
config 있는 repo 설정
Sync pushed gitOps config

# Logging -> 프로메테우스, 그라파나
