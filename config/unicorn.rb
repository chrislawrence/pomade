root = "/home/chris/apps/pomade/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.pomade.sock"
worker_processes 2
timeout 30
preload_app true