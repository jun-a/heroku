namespace :db do
  task :backup do
    system "mysqldump --opt --user=root --password=jun910
    rejobook_develop > db_backup/#{Time.zone.today}rejobook_backup.sql"
  end
end
