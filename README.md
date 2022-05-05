# Tentris Paper Benchmarks

## Usage

### Ansible

[Ansible](https://www.ansible.com/overview/how-ansible-works) is an automation that uses plain SSH connections to configure systems according to a so called playbook.  
A playbook defines a target statefor a system and Ansible takes steps to transform the current state into the desired state.  
Ansible is executed on a so called control node (For example your PC, laptop, workstation, ...) and connects to one or more managed nodes (For example a server, VM, remote PC, ...).

### Preperation

Install Ansible on your control node using the official install guide: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

This playbook was tested with `Jinja2==3.0.3` and `ansible==5.7.0`. 

Prepare your Ansible inventory.  
Ansible usues a so called inventory to know which managed nodes to connect to and apply some settings to hosts.  
A inventory template can be found in `inventory.yaml.example`.

#### GraphDB download uuid

GraphDB is a commercial product and requires a license to download.  
You can get a free license here: https://www.ontotext.com/products/graphdb/graphdb-free/  
After filling out the form, you will receive an e-mail containing a download link.
Use it to download the file, right click on the download in your browser and select the `Copy download link` option.  
The download link should look like this: `https://download.ontotext.com/owlim/<Your GraphDB UUID>/graphdb-free-9.1.1-dist.zip`

### Playbook execution

If you have prepared the inventory you can execute the playbook.  
To do this use the `ansible-playbook -kKi inventory.yaml playbook.yaml` command.  
It will ask you for your SSH password and your become (sudo) password.  
After you have entered your password the execution will start.

## Dataset and Queris

Links to the datasets and queries can be found in:
- [roles/dataset_swdf](./roles/dataset_swdf)
- [roles/dataset_dbpedia2015](./roles/dataset_dbpedia2015)
- [roles/dataset_dbpedia2015](./roles/dataset_dbpedia2015)
- [roles/dataset_wikidata-20201111](./roles/dataset_wikidata-20201111) 