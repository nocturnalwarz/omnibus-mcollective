#
# Copyright 2017 YOUR NAME
#
# All Rights Reserved.
#

name "omnibus-mcollective"
maintainer "Jason Miller"
homepage "https://puppetlabs.com/mcollective/introduction/"

# Defaults to C:/omnibus-mcollective on Windows
# and /opt/omnibus-mcollective on all other platforms
install_dir "#{default_root}/#{name}"

build_version '2.11.0'
build_iteration ENV['BUILD_ITERATION']

# Creates required build directories
dependency "preparation"

dependency "mcollective"
dependency "mcollective-puppet-agent"
dependency "mcollective-package-agent"
dependency "mcollective-shell-agent"
dependency "mcollective-service-agent"
dependency "mcollective-filemgr-agent"
dependency "mcollective-yum-agent"

override :ruby, version: "2.4.1"
override :rubygems, version: "2.6.11"

# mcollective dependencies/components
# dependency "somedep"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
