# Ansible Role: Jenkins Plugin CLI

[![CI](https://github.com/v1v/ansible-role-jenkins_plugin_cli/workflows/CI/badge.svg?event=push)](https://github.com/v1v/ansible-role-jenkins_plugin_cli/actions?query=workflow%3ACI)

Installs Jenkins plugins using the [plugin-installation-manager-tool](https://github.com/jenkinsci/plugin-installation-manager-tool) on RHEL/CentOS and Debian/Ubuntu servers.

## Requirements

This role requires:
* `Java 8+` (see the test playbooks inside the `molecule/default` directory for an example of how to use Java for your OS).
* `Jenkins`

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    jenkins_home: /var/lib/jenkins

The Jenkins home directory which, amongst others, is being used for storing artifacts, workspaces and plugins. This variable allows you to override the default `/var/lib/jenkins` location.

    jenkins_user: jenkins
    jenkins_owner: jenkins

The Jenkins user and owner.

    jenkins_plugin_cli_location: /opt/jpl.jar

The location at which the `jenkins-plugin-manager.jar` jarfile will be kept. This is used for installing the Jenkins plugins via the CLI.

    jenkins_plugin_cli_url: "https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.1.1/jenkins-plugin-manager-2.1.1.jar"

Sets the jenkins-plugins-cli URL where the jarfile is stored.

    plugin_file: ""

Path to the `plugins.txt`, or `plugins.yaml` file, which contains a list of plugins to install. If this file does not exist, or if the file exists, but does not have a .txt or .yaml/.yml extension, then an error will be thrown.

    plugin_download_directory: ""

Directory in which to install plugins. If no directory configuration is provided, the defaults are C:\ProgramData\Jenkins\Reference\Plugins if the detected operating system is Microsoft Windows, or /usr/share/jenkins/ref/plugins otherwise.

    plugins: ""

List of plugins to install (see plugin format [here](https://github.com/jenkinsci/plugin-installation-manager-tool#plugin-input-format)), separated by a space.

    jenkins_war_location: ""

Path to Jenkins war file. If no war file is entered, will default to /usr/share/jenkins/jenkins.war or C:\ProgramData\Jenkins\jenkins.war, depending on the user's OS.

    verbose: false

Set to true to show additional information about plugin dependencies and the download process.

    output: "stdout"

Format to output plugin updates file in, stdout is the default. Options: "json", "stdout". "yaml"

    latest: false

Set to false to download the minimum required version of all dependencies.

    latest_specified: false

Set to true to download latest dependencies of any plugin that is requested to have the latest version. All other plugin dependency versions are determined by the update center metadata or the plugin MANIFEST.MF.

    jenkins_update_center_url: https://updates.jenkins.io/update-center.actual.json

Sets the main update center.

    jenkins_experimental_update_center_url: https://updates.jenkins.io/experimental/update-center.actual.json

Sets the experimental update center.

    jenkins_incrementals_repo_mirror_url: https://repo.jenkins-ci.org/incrementals

Sets the incrementals repository mirror.

    jenkins_plugin_info_url: https://updates.jenkins.io/current/plugin-versions.json

Sets the location of plugin information.

    jenkins_uc_download_url: ""

Sets the URL from where plugins will be downloaded from. Often used to cache or to proxy the Jenkins plugin download site. If set then all plugins will be downloaded through that URL.

    download: true

Set to false to not download plugins.

    jenkins_plugin_cli_java_options: ""

Extra Java options for the jenkins-plugin-cli command can be set with the var `jenkins_plugin_cli_java_options`. For example, if you are running behind a proxy server, configure this option appropriately `-Dhttp.proxyPort=3128 -Dhttp.proxyHost=myproxy.example.com`.

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