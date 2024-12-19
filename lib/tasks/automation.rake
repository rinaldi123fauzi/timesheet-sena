namespace :automation do
  desc 'Automation Starting'
  task :import_calender_holiday => [:environment] do
    Holiday.new.import
  end
end