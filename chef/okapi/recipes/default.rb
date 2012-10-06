distro = "cdh3"
node[:hadoop][:distribution] = distro

node[:okapi][:giraph][:config] = {
  "giraph.SplitMasterWorker" => false
}

include_recipe "hadoop::conf_pseudo"

template "#{node[:hadoop][:config_dir][distro]}/giraph-site.xml" do
  group "hadoop"
  mode "644"
end
