namespace :heroku do

  namespace :db do

    desc "clones the heroku app DB, copies much faster than heroku db:pull, doesn't use taps"
    task :pull => ["heroku:db:fetch", "heroku:db:import", "db:migrate"]

    task :fetch do
      a = ENV['app'] || 'threaded'
      puts "Fetching database from #{a}"
      system %Q{
        #{"heroku pgbackups:capture -a #{a} --expire" unless ENV['no_capture']}
        #{"curl -o /tmp/threads.dump `heroku pgbackups:url -a #{a}`" unless ENV['use_local_dump']}
      }
    end

     task :import do
      a = ENV['app'] || 'threads'
      puts "Importing #{a} dump into development database."
      system %Q{
        rake db:drop db:create
        pg_restore --verbose --clean --no-acl --no-owner -d threads_development /tmp/threads.dump
      }
    end

  end

  task :deploy do
    system 'git push heroku master'
    system 'heroku run rake db:migrate'
  end

end
