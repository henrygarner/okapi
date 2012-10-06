distro = "cdh3"
node[:hadoop][:distribution] = distro

node[:maven][:version] = "3"
node[:maven]['3'][:url] = "http://mirror.catn.com/pub/apache/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz"
node[:maven]['3'][:checksum] = nil

node[:okapi][:giraph][:config] = {
  "giraph.SplitMasterWorker" => false
}

include_recipe "git"
include_recipe "hadoop::conf_pseudo"
include_recipe "maven"

template "#{node[:hadoop][:config_dir][distro]}/giraph-site.xml" do
  group "hadoop"
  mode "644"
end

git "/home/vagrant/giraph" do
  repository "git://git.apache.org/giraph.git"
  revision "HEAD"
  action :sync
  user 'vagrant'
  group 'vagrant'
end
