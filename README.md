# Ansible Role: Jenkins Plugin CLI

[![CI](https://github.com/v1v/ansible-role-jenkins_plugin_cli/workflows/CI/badge.svg?event=push)](https://github.com/v1v/ansible-role-jenkins_plugin_cli/actions?query=workflow%3ACI)

Installs Jenkins plugins using the [plugin-installation-manager-tool](https://github.com/jenkinsci/plugin-installation-manager-tool) on RHEL/CentOS and Debian/Ubuntu servers.

## Requirements

This role requires:
* `Java 8+` (see the test playbooks inside the `molecule/default` directory for an example of how to use Java for your OS).
* `Jenkins`

## Role Variables

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

## Dependencies

None.

## Example Playbook

```yaml
- hosts: jenkins
  become: true
  
  vars:
    plugin_file: /tmp/plugins.txt
    java_packages:
      - openjdk-8-jdk

  roles:
    - role: geerlingguy.java
    - role: geerlingguy.jenkins
    - role: v1v.jenkins_plugin_cli
```

## License

MIT

## Author Information

This role was created in 2020 by Victor Martinez.