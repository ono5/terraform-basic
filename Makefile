.PHONY: init validate plan apply destroy fmt console

init:
	docker-compose run --rm terraform init

validate:
	docker-compose run --rm terraform validate

plan:
	docker-compose run --rm terraform plan -auto-approve

apply:
	docker-compose run --rm terraform apply -auto-approve

destroy:
	docker-compose run --rm terraform destroy -auto-approve

fmt:
	docker-compose run --rm terraform fmt -recursive

console:
	docker-compose run --rm terraform console
