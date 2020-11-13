#!/bin/sh

## Enable flags based on the ansible variables

if [ -d "{{ plugin_download_directory }}" ] ; then
    plugin_download_directory_flag="--plugin-download-directory {{ plugin_download_directory }}"
fi
if [ -n "{{ plugins }}" ] ; then
    plugins_flag="--plugins {{ plugins }}"
fi
if [ -f "{{ plugin_file }}" ] ; then
    plugin_file_flag="--plugin-file {{ plugin_file }}"
fi
if [ -n "{{ output }}" ] ; then
    output_flag="--output {{ output }}"
fi
if [ "{{ verbose }}" = "true" ] ; then
    verbose_flag="--verbose"
fi
if [ "{{ latest }}" = "true" ] ; then
    latest_flag="--latest true"
fi
if [ "{{ latest_specified }}" = "true" ] ; then
    latest_specified_flag="--latest-specified true"
fi
if [ "{{ download }}" = "false" ] ; then
    download_flag="--no-download"
fi
if [ -f "{{ jenkins_war_location }}" ] ; then
    war_flag=--war "{{ jenkins_war_location }}"
fi
if [ -e "{{ jenkins_home }}/updates/default.json" ] ; then
    jenkins_update_center_flag="--jenkins-update-center file://{{ jenkins_home }}/updates/default.json"
fi
if [ -e "{{ jenkins_home }}/updates/plugin-versions.json" ] ; then
    jenkins_plugin_info_flag="--jenkins-plugin-info file://{{ jenkins_home }}/updates/plugin-versions.json"
fi
if [ -n "{{ jenkins_incrementals_repo_mirror_url }}" ] ; then
    jenkins_incrementals_repo_mirror_flag="--jenkins-incrementals-repo-mirror {{ jenkins_incrementals_repo_mirror_url }}"
fi

## Enable debug output
set -x
java {{ jenkins_plugin_cli_java_options }} \
    -jar "{{ jenkins_plugin_cli_location }}" \
    ${plugin_download_directory_flag} \
    ${verbose_flag} \
    ${war_flag} \
    ${latest_specified_flag} \
    ${latest_flag} \
    ${output_flag} \
    ${download_flag} \
    ${plugins_flag} \
    ${plugin_file_flag} \
    ${jenkins_update_center_flag} \
    ${jenkins_plugin_info_flag} \
    ${jenkins_incrementals_repo_mirror_flag}