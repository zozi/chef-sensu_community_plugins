package "git"

git node['sensu_community_plugins']['path'] do
  repository node['sensu_community_plugins']['repository']
  reference node['sensu_community_plugins']['reference']
  action :sync
end

%w(plugins handlers mutators extensions).each do |group|
  link "#{node['sensu']['directory']}/#{group}/#{node['sensu_community_plugins']['subfolder']}" do
    to "#{node['sensu_community_plugins']['path']}/#{group}"
  end
end
