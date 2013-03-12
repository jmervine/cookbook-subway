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
include_recipe 'nginx_proxy'

url    = node['subway']['src_url']
branch = node['subway']['git_branch']
user   = node['subway']['user']

if user == "root"
  dest = node['subway']['destination']
else
  dest = "/home/#{user}/subway"
end

git "#{dest}" do
  action     :export
  repository url
  revision   branch
end

execute "npm install" do
  cwd dest
  if user == "root"
    creates "/usr/local/lib/node_modules/npm"
  else
    creates "/home/#{user}/.npm"
  end
end

bash "usage" do
  if user == "root"
    code <<-EOM
      echo "To run subway, login in to `hostname` and run the following commands:"
      echo " "
      echo "  $ sudo #{dest}/subway"
      echo " "
    EOM
  else
    code <<-EOM
      echo "To run subway, login in to `hostname` and run the following commands:"
      echo " "
      echo "  $ cd /home/#{user}/subway"
      echo "  $ npm subway"
      echo " "
    EOM
  end
end

# vim: filetype=ruby
