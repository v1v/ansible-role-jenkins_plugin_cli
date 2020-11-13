#!/bin/sh -x

## Enable flags based on the ansible variables
if [ -z "{{ plugins }}" ] ; then
    plugins_flag="--plugins {{ plugins }}"
fi
if [ -e "{{ jenkins_home }}/plugins.txt" ] ; then
    plugin_file_flag="--plugin-file {{ jenkins_home }}/plugins.txt"
fi
if [ -e "{{ jenkins_home }}/updates/default.json" ] ; then
    jenkins_update_center_flag="--jenkins-update-center file:////{{ jenkins_home }}/updates/default.json"
fi
if [ -e "{{ jenkins_home }}/updates/plugin-versions.json" ] ; then
    jenkins_plugin_info_flag="--jenkins-plugin-info file:////{{ jenkins_home }}/updates/plugin-versions.json"
fi
if [ "{{ skip_failed_plugins }}" = "true" ] ; then
    skip_failed_plugins_flag="--skip-failed-plugin"
fi
java -jar "{{ jenkins_plugin_cli_location }}" \
    --verbose \
    --war "{{ jenkins_war_location }}"
    ${plugins_flag} \
    ${plugin_file_flag} \
    ${skip_failed_plugins_flag} \
    ${jenkins_update_center_flag} \
    ${jenkins_plugin_info_flag}