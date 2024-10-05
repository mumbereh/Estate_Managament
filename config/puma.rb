# This configuration file will be evaluated by Puma.

# Set the minimum and maximum number of threads.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Set the worker count based on the number of available processors.
if ENV["RAILS_ENV"] == "production"
  require "concurrent-ruby"
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { Concurrent.physical_processor_count })
  workers worker_count if worker_count > 1
end

# Set the worker timeout for production.
worker_timeout 60 # Adjust this as needed for your application.

# Specify the port that Puma will listen on.
port ENV.fetch("PORT") { 3000 }

# Specify the environment that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "production" }

# Specify the pidfile that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Allow Puma to be restarted by the `bin/rails restart` command.
plugin :tmp_restart

# Preload the application before forking workers for better performance.
preload_app!

# Ensure the worker count is correctly set.
workers ENV.fetch("WEB_CONCURRENCY") { 4 }
