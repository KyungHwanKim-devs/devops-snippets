# devOps 공부를 위한 코드 스니펫 모음

포크 떠가서 사용할것

## Gitlab Flow

1. production, main(master)
2. main에서 따온 feature(hotfix) 브랜치들
3. feature(hotfix)브랜치는 엄격한 리뷰를 통해 main에 머지
4. main을 production에 푸시

(https://blog.kakaocdn.net/dn/cpFS3u/btrswUeKUIu/0VzMlqENM1oD2SKo8kPlZ0/img.png)

# 서버운영갯수?

브랜치랑 똑같이?
일정시간 띄울수 있는 파드면 푸시할때마다 배포 후 시간지나면 파드삭제 및 이미지 삭제 <- 가능?

# networkForEks -> 아마존 EKS을 위한 네트워크(VPC) 설정

파일 뜯어보기
vpc 먼저 init 후 apply

# k9s

# update-kubeconfig 에 --name=클러스터 이름으로 수정

kubectx

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
