# terraform_handson_on_docker

This is sample repo for terraform on docker.

## Structure
```
terraform_handson_on_docker
├── README.md
├── docker
│   ├── reset_docker.sh
│   └── terraform
│       ├── Dockerfile
│       └── init.sh
├── docker-compose.yml
└── src
    ├── main.tf
    └── variable.tf
```

## environment

### terraform
```
$ terraform --version
Terraform v0.12.13
+ provider.aws v2.34.0
```

### aws cli
```
$ aws --version
aws-cli/1.16.168 Python/3.6.9 Linux/4.9.184-linuxkit botocore/1.13.8
```

## Export Environment Variable
```
# Your own AWS Access Key ID
$ export AWS_ACCESS_KEY_ID='xxxxxxxxxxxxx'

# Your own AWS Secret Access Key
$ export AWS_SECRET_ACCESS_KEY='xxxxxxxxxxxxxxxxxx'
```

## Stand Up docker
```
$ docker-compose build
```

## Dive into docker container
```
$ docker-compose run --rm terraform bash
```

## Execute Terraform
```
$ terraform init
$ terraform plan
$ terraform apply
```

## Reference
- [dockerでterraform環境を作る - Qiita](https://qiita.com/reflet/items/de57ae767c8f368372ba#terraform%E6%A7%8B%E7%AF%89)
- [Terraformとは - Terraformで構築するAWS](https://y-ohgi.com/introduction-terraform/first/about/)

