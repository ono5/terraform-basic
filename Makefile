.PHONY: init validate plan apply destroy fmt console show output

init:
	terraform init
	# docker-compose run --rm terraform init

validate:
	terraform validate
	# docker-compose run --rm terraform validate

plan:
	terraform plan
	# docker-compose run --rm terraform plan

apply:
	terraform apply -auto-approve
	# docker-compose run --rm terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve
	# docker-compose run --rm terraform destroy -auto-approve

fmt:
	terraform fmt -recursive --diff
	# docker-compose run --rm terraform fmt -recursive --diff

console:
	terraform console
	# docker-compose run --rm terraform console

show:
	terraform show
	# docker-compose run --rm terraform show

output:
	terraform output
	# docker-compose run --rm terraform output
