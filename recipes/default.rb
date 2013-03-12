#
# Cookbook Name:: subway
# Recipe:: default
#
if node["platform"] == "windows"
  return "#{node['platform']} is not supported by the #{cookbook_name}::#{recipe_name} recipe"
end

include_recipe 'git'
include_recipe 'nodejs'
include_recipe 'npm'
include_recipe 'nginx'
include_recipe 'nginx_proxy'

url    = node['subway']['src_url']
branch = node['subway']['git_branch']
dest   = node['subway']['destination']

git "#{dest}" do
  action :export
  repository url
  revision branch
end

execute "npm install" do
  cwd dest
  creates "~/.npm"
end

bash "usage" do
  code <<-EOM
    echo "To run subway, login in to `hostname` and run the following commands:"
    echo " "
    echo "  $ cd #{dest}"
    echo "  $ npm subway"
    echo " "
  EOM
end

# vim: filetype=ruby
