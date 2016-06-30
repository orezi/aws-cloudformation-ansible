# AWS Cloudformation script with Ansible

Clone this repo: 

```git clone https://github.com/andela-oolarewaju/aws-cloudformation-ansible.git ```

Then:

```$ cd aws-cloudformation-ansible```

Create a ```vars.yml``` file and put your access key and secret key like:
```
aws_access_key_id: YOURACCESSKEY
aws_secret_access_key: YOURSECRETKEY
```

This file **SHOULD NOT** be public

**RUN** `ansible-playbook playbook.yml -f 10`