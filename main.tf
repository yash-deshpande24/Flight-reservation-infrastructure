aws s3api create-bucket `
  --bucket cbz-terraform-state-prod `
  --region us-west-2 `
  --create-bucket-configuration LocationConstraint=us-west-2


aws s3api put-bucket-versioning \
  --bucket cbz-terraform-state-prod \
  --versioning-configuration Status=Enabled


aws dynamodb create-table `
  --table-name terraform-locks `
  --attribute-definitions AttributeName=LockID,AttributeType=S `
  --key-schema AttributeName=LockID,KeyType=HASH `
  --billing-mode PAY_PER_REQUEST `
  --region us-west-2

docker run -d --name flight-app -p 8080:8080 flight-reservation-app

aws configure
aws eks update-kubeconfig \
  --region us-west-2 \
  --name flight-reservation-system-cluster