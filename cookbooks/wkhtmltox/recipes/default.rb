#
# Cookbook Name:: wkhtmltox
# Recipe:: default
#
# Copyright 2014, N/A
#
# All rights reserved - Do Not Redistribute
#

FILENAME='wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm'
SHASUM='00097422ec2c21c33e22c41123bb2e1012a57b0e820bedef7e283882f7c15df6'

%w{ld-linux.so.2 xorg-x11-fonts-75dpi xorg-x11-fonts-Type1 ipa-gothic-fonts ipa-pgothic-fonts ipa-pmincho-fonts ipa-mincho-fonts}.each do |name|
  package name do
    action :install
  end
end

cookbook_file "/tmp/#{FILENAME}" do
  source "#{FILENAME}"
  checksum "#{SHASUM}"
end

package "WkHTMLtoX" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{FILENAME}"
end 
