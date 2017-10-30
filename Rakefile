# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

def running_tasks
  @running_tasks ||= Rake.application.top_level_tasks
end

def is_running_migration?
  running_tasks.include?("db:migrate")
end
