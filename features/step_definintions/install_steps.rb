require 'open3'

When(/^I install boto$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'setup_boto'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^it should be successful$/) do
  expect(@status.success?).to eq(true)
end

When(/^I setup aws account$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'setup_aws_account'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I create S3 bucket$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'create_bucket'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I upload static files to website$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'upload_static_website'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I setup s3 bucket for hosting$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'setup_hosting'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I compile cloudformation template with jinja$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'convert_jinja'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I launch cloudformation template$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'launch_cloudformation'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I create AMI$/) do
	cmd = "ansible-playbook -i inventory.ini playbook.yml --tags 'create_ami'"
	output, error, @status = Open3.capture3 "#{cmd}"
end
