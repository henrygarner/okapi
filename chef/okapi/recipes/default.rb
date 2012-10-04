node[:hadoop][:distribution] = "cdh3"

node[:maven][:version] = "3"
node[:maven]['3'][:url] = "http://mirror.catn.com/pub/apache/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz"
node[:maven]['3'][:checksum] = nil

include_recipe "git"
include_recipe "hadoop::conf_pseudo"
include_recipe "maven"

git "/home/vagrant/giraph" do
  repository "git://git.apache.org/giraph.git"
  revision "HEAD"
  action :sync
  user 'vagrant'
  group 'vagrant'
end
