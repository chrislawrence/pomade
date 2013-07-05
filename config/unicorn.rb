# This config script is heavily inspired by GitHub
# https://github.com/blog/517-unicorn
 
app_directory = "/home/chris/apps/pomade/current"
 
worker_processes 4
 
working_directory app_directory
 
listen "unix:#{app_directory}/tmp/pids/unicorn.sock", :backlog => 1024
# listen 3000
 
timeout 60
 
user 'hh', 'hh'
 
File.umask(027)
 
preload_app true
 
pid "#{app_directory}/tmp/pids/unicorn.pid"
 
stderr_path "#{app_directory}/log/unicorn.stderr.log"
stdout_path "#{app_directory}/log/unicorn.stdout.log"
 
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end
 
before_fork do |server, worker|
  ##
  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.
 
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
  # the following is recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
end
 
after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end