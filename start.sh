rm -rf tmp/pids
mkdir -p tmp/pids

bundle exec rails db:migrate
service cron start
whenever --update-crontab
QUEUE=* bundle exec rake environment resque:work&
rake environment resque:scheduler&
bundle exec foreman start