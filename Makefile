.PHONY: test clean

test: .terraform
	AWS_DEFAULT_REGION=us-east-2 terraform validate
	terraform fmt -check
	! grep -l TF-UPGRADE-TODO *.tf
	# Check for badge in README.md
	grep -q "\[\!\[Build Status\]([^)]*)\]([^)]*)" README.md

clean:
	rm -rf .terraform

.terraform:
	terraform init -backend=false
	terraform version
