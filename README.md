## devOps 공부를 위한 코드 스니펫 모음

포크 떠가서 사용할것

# Gitlab Flow

1. production, main(master)
2. main에서 따온 feature(hotfix) 브랜치들
3. feature(hotfix)브랜치는 엄격한 리뷰를 통해 main에 머지
4. main을 production에 푸시

![gitlabflow 사진](https://blog.kakaocdn.net/dn/cpFS3u/btrswUeKUIu/0VzMlqENM1oD2SKo8kPlZ0/img.png)

# 서버운영갯수?

1. production
2. main
3. a. feature(?) -> 일정시간 띄울수 있는 파드면 푸시할때마다 배포 후 시간지나면 파드삭제 및 이미지 삭제 <- 가능?
   b. feature 서버 만들어서 푸시시에 파드생성

# VPC -> 아마존 EKS을 위한 네트워크(VPC) 설정

- 테디랩스 모듈 사용 https://registry.terraform.io/modules/tedilabs/network/aws/latest/submodules/vpc
- 테디랩스 모듈 깃헙 https://github.com/tedilabs/terraform-aws-network

# EKS -> 아마존 EKS 마스터플레인 + 워커노트 + irsa + fargate

- 테디랩스 모듈 사용 https://registry.terraform.io/modules/tedilabs/container/aws/latest
- 테디랩스 모듈 깃헙 https://github.com/tedilabs/terraform-aws-container

# k9s

- https://k9scli.io/

# update-kubeconfig 에 --name=클러스터 이름으로 수정

aws eks update-kubeconfig --region ap-northeast-2 --name <이름> --role-arn arn:aws:iam::<AWS_ACCOUNT_ID>:role/<생성한 롤 이름>

# kubectx

# Kustomize

- https://kustomize.io/

gitOps config 파일은 kustomize로 관리
patch 로 base - main(master), dev, production config

# CI -> Github action

1. Github action trigger
2. dockerfile build (on github action)
3. push image on ecr (on github action)
4. commit & push gitOps config(on github action)

# CD -> ArgoCD(fargate)

fargate profile 생성 -> argocd 네임스페이스로

1. 워커노드 띄운후 설치

- kubectl create namespace argocd
- kubectl apply -n argocd -f <https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml>

2. kubectl apply -f <ingress yaml 경로> -n argocd

3. EKS Cluster 보안 그룹에 로드밸런서 보안 그룹 추가하기
   위에서 설명했듯이 EKS Cluster 보안 그룹에 로드밸런서가 접근하지 못하도록 설정되어있다. 따라서 접근할 수 있도록 인바운드 규칙을 추가해주어야 한다. (로드밸런서 보안 그룹은 로드밸런서 를 선택해서 찾아볼 수 있다.)

   EKS Cluster 보안 그룹은 EKS > 클러스터 선택 > 구성 > 네트워크 > 클러스터 보안 그룹 해당 부분에 파랗게 링크된 보안 그룹을 클릭해서 들어가면 안 헷갈리게 찾아서 들어갈 수 있다. (보안 그룹을 잘 찾을 수 있으면 EC2 > 네트워크 및 보안 > 보안 그룹 에 들어가서 찾아도 된다.)

   따라서 EKS Cluster 보안 그룹에 모든 트래픽으로 유형을 선택한 뒤 소스 부분에 로드밸런서 보안 그룹을 추가한다. 해당 부분을 추가해야 로드밸런서가 EKS Cluster 의 리소스에 접근할 수 있다.

   만약 EKS Cluster 보안그룹에 8080 포트 설정이 없다면 로드밸런서 보안그룹리 접근할 수 있도록 8080포트에 대해서 설정해줄 수 있도록 한다.

4. admin 비밀번호

- kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

5. config 있는 repo 설정 -> password에 GitHub Access Token

6. app 생성 - Namespace: default (자신이 원하는 네임스페이스로 설정해도됨, 단 fargate profile 설정이 된 네임스페이스로 지정해야됨)

# Logging -> 프로메테우스, 그라파나
