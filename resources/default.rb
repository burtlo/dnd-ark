actions :install
default_action :install

property :version, String
property :source, String

action :install do
  source_url = source

  remote_file "/tmp/redis-#{version}.tar.gz" do
    source source_url
    notifies :run, "execute[unzip_redis_archive]", :immediately
  end

  execute "unzip_redis_archive" do
    command "tar xzf redis-#{version}.tar.gz"
    cwd "/tmp"
    action :nothing
    notifies :run, "execute[build_and_install_redis]", :immediately
  end

  execute "build_and_install_redis" do
    command 'make && make install'
    cwd "/tmp/redis-#{version}"
    action :nothing
    # notifies :run, "execute[install_server_redis]", :immediately
  end

  execute "install_server_redis" do
    command "echo -n | ./install_server.sh"
    cwd "/tmp/redis-#{version}/utils"
    action :run
  end

end
