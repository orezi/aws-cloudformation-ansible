require 'open3'

cloudformation_stack_name = ""
key_value = ""
ami_name = ""

When(/^I install boto$/) do
	cmd = "ansible-playbook playbook.yml --tags 'setup_boto'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^it should be successful$/) do
  expect(@status.success?).to eq(true)
end

When(/^I setup aws account$/) do
	cmd = "ansible-playbook playbook.yml --tags 'setup_aws_account'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I create S3 bucket$/) do
	cmd = "ansible-playbook playbook.yml --tags 'create_bucket'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I upload static files to website$/) do
	cmd = "ansible-playbook playbook.yml --tags 'upload_static_website'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I setup s3 bucket for hosting$/) do
	cmd = "ansible-playbook playbook.yml --tags 'setup_hosting'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I compile cloudformation template with jinja$/) do
	cmd = "ansible-playbook playbook.yml --tags 'convert_jinja'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I launch cloudformation template$/) do
	cmd = "ansible-playbook playbook.yml --tags 'cloudformation'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^cloudformation stack should be in state: complete$/) do
  cmd = "aws cloudformation describe-stacks --stack-name #{cloudformation_stack_name}"
  output, error, status = Open3.capture3 "#{cmd}"
  json_out = JSON.parse(output)
  expect(status.success?).to eq(true)
  expect(json_out["Stacks"][0]["StackStatus"]).to match("CREATE_COMPLETE")
end

When(/^I create AMI$/) do
	cmd = "ansible-playbook playbook.yml --tags 'cloudformation,create_ami,pause'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^ami should exist$/) do
  cmd = "aws ec2 describe-images --filters Name=tag-key,Values=#{key_value} Name=tag-value,Values=#{ami_name} --query 'Images[*].{ID:ImageId}' | grep ami"
  output, error, status = Open3.capture3 "#{cmd}"
  expect(output).to match("ami*")
end
