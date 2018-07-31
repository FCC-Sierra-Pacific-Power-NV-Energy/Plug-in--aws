# Ansible Plug-in Workflow Step Package
# vCommander Supported Build Version 1006050089

This package contains a vCommander plug-in workflow step for integrating with Ansible https://www.ansible.com/.  

It was designed specifically for use in the vCommander workflow extension scenario *Installing Ansible Playbooks*, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home).

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Run ansible-playbook

### Run ansible-playbook
**Purpose:** Executes the ansible-playbook command to install a playbook on a target VM

**Details:** 
 * https://docs.ansible.com/ansible/2.4/ansible-playbook.html
 * Copies playbook from URL or inline YAML to `/tmp/pb-[Workflow ID].yaml` on target VM
 * Executes `ansible-playbook -i localhost, -c local /tmp/pb-[Workflow ID].yaml`
 * If successful, deletes `/tmp/pb-[Workflow ID].yaml`

**Inputs:** 
 * Input field for timeout (in seconds)
 * Input field for Playbook URL - HTTP(s), file S3 path for playbook (one of URL or YAML must be specified)
 * Text Area for Playbook YAML - Inline YAML playbook (one of URL or YAML must be specified)
 * Text Area for Extra Variables - Set of additional variables as key=value (one per line) or YAML/JSON. If filename, prepend with @

## Installation

Plug-in workflow steps are supported with vCommander release 7.0 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return codes

* For ansible-playbook return codes and output, see https://docs.ansible.com/ansible/2.4/ansible-playbook.html

### Generic return codes

+ **0** - *Step completed successfully*

### Ansible return codes
+ **1** - *Unable to download playbook*
+ **2** - *SSL connection errors*
+ **3** - *Unable to create playbook file*
+ **4** - *Unable install Ansible playbook*

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

<vcommander-install>\tomcat\common\classes\log4j2.xml 

+ **Run ansible-playbook** 
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.ansible.runplaybook"/>`

## Notes
   * Requires ansible-playbook command to be installed on target VM. See *Installing Ansible Playbooks* on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home).
   * You must install Ansible playbooks as the root user, and you must run sudo without prompting for a password. The Amazon Linux 1 and 2, RedHat and Ubuntu AMIs from the AWS Marketplace are already set up to not require a password. In the case of the Amazon Linux and RedHat AMIs, the ec2-user account is set up to not require a password, and for the Ubuntu AMI, the the ubuntu account is set up to not require a password. For VMs deployed from other templates, you must modify the sudoers file to allow the user to run sudo commands without prompting for a password. To learn how, see https://www.cyberciti.biz/faq/linux-unix-running-sudo-command-without-a-password/