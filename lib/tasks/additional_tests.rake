namespace :test do
  
  Rake::TestTask.new(scheduler: 'test:prepare') do |t|
    t.pattern = 'test/lib/scheduler_test.rb'
  end

end