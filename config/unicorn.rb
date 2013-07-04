env = ENV["RAILS_ENV"] || "development"
pid = "/tmp/unicorn.pomade.pid"
worker_processes 4

listen "/tmp/pomade.socket", :backlog => 64
preload_app true
timeout 30

working_directory "/home/chris/apps/pomade/current"
user "chris"
shared_path = "/home/chris/apps/pomade/shared"

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "/tmp/unicorn.pomade.pid.oldbin"
  
  if File.exists?(old_pid) && serer.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno:ENOENT, Errno:ESRCH
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end

