
# Ansible Dynamic Inventory for AWS EC2

## Objective
Set up Ansible dynamic inventories to automatically discover and manage EC2 instances in AWS. Use dynamic inventories to scale playbook execution across different environments.

## Prerequisites
- Ansible installed
- AWS CLI configured with appropriate credentials
- Python `boto3` library installed

## Installation

1. **Install Ansible and boto3**:
   ```bash
   pip install ansible boto3
   ```

2. **Configure AWS CLI**:
   ```bash
   aws configure
   ```

## Setup

1. **Create Inventory Configuration**:
   Create `aws_ec2.yml` in the `inventory` directory:

   ```yaml
   plugin: aws_ec2
   regions:
     - us-east-1
     - us-west-2
   filters:
     instance-state-name: running
   keyed_groups:
     - key: tags.Name
       prefix: name
   hostnames:
     - tag:Name
   compose:
     ansible_host: public_ip_address
     ansible_user: ec2-user
     ansible_ssh_private_key_file: /path/to/your/private/key.pem
   ```

2. **Update `ansible.cfg`**:
   Edit your `ansible.cfg` to point to the inventory configuration file:

   ```ini
   [defaults]
   inventory = ./inventory/aws_ec2.yml
   ```

## Usage

1. **Test the Inventory**:
   ```bash
   ansible-inventory --graph
   ```

2. **Create a Playbook**:
   Create `playbook.yml`:

   ```yaml
   ---
   - name: Test dynamic inventory
     hosts: all
     tasks:
       - name: Ping all hosts
         ping:
   ```

3. **Run the Playbook**:
   ```bash
   ansible-playbook playbook.yml
   ```

## Troubleshooting

1. **SSH Key Issues**:
   Ensure the private key has correct permissions:
   ```bash
   chmod 400 /path/to/your/private/key.pem
   ```

2. **Manual SSH Test**:
   Test the SSH connection:
   ```bash
   ssh -i /path/to/your/private/key.pem ec2-user@<public_ip_address>
   ```

3. **Known Hosts**:
   Add the host to known hosts:
   ```bash
   ssh-keyscan -H <public_ip_address> >> ~/.ssh/known_hosts
   ```

## Conclusion
By following these steps, you have configured Ansible to use dynamic inventory for managing AWS EC2 instances, enabling scalable playbook execution across environments.
