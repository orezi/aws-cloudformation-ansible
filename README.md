# AWS Cloudformation script with Ansible

Clone this repo: 

```git clone https://github.com/andela-oolarewaju/aws-cloudformation-ansible.git ```

Then:

```$ cd aws-cloudformation-ansible```

Create a ```vars.yml``` file and put the following credentials and variables like:
```
aws_access_key_id: YOURACCESSKEY
aws_secret_access_key: YOURSECRETKEY
s3_website_index_document: "YOURINDEXFILE.html"
s3_website_error_document: "YOURERRORFILE.html"
s3_website_domain: "BUCKETNAME"
launch_cfg_name: "LAUNCHCONFIGNAME"
region: "REGION"
instance_type: "INSTANCETYPE"
autoscaling_grp: "AUTOSCALINGGROUPNAME"
ami_name: "AMI-NAME"
cloudformation_name: "CLOUDFORMATIONSTACK-NAME"
```

This file **SHOULD NOT** be public

**RUN** `ansible-playbook playbook.yml -f 10`