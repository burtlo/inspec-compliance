# Needed to provide a nice way to ask for params
# in the rake tasks
require 'highline/import'

task :default => :help

task :first do
  puts `chef exec inspec exec first.rb`
end

task :first_remote do
  system 'chef exec inspec exec first.rb --backend=ssh --host=ec2-54-158-32-60.compute-1.amazonaws.com --user=chef --password=chef'
end

task :create_first do
  `echo 'Hello World' > first.txt`
end

task :help do
  puts `chef exec inspec help exec`
end

task :audit_package do
  puts `chef exec inspec archive broken_arrow`
  puts `cp ./broken_arrow.tar.gz cookbooks/load_balancer/files/default/broken_arrow.tar.gz`
end

task :create_profile do
  profile_name = ask 'Please provide a profile name:'
  exit "Please specify a profile name" unless profile_name
  puts `chef exec inspec init profile #{profile_name}`
end

task :remove_profile do
  profile_name = ask 'Please provide a profile name:'
  exit "Please specify a profile name" unless profile_name
  puts `rm #{profile_name}`
end
