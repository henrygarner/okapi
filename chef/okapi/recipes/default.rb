node[:java][:java_home] = "/usr/lib/jvm/java-6-openjdk"

node[:hadoop][:distribution] = "cdh4"

node[:maven][:version] = '3'
node[:maven]['3'][:url] = "http://apache.mirrors.timporter.net/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz"
node[:maven]['3'][:checksum] = nil # "e513740978238cb9e4d482103751f6b7"

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

execute "mvn install -DskipTests" do
  cwd "/home/vagrant/giraph"
  user 'vagrant'
  group 'vagrant'
end
