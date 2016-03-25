task :import_database => :environment do
  puts "Importing database..."
  ImportDatabase.import_march_2015
  ImportDatabase.import_august_2015
  ImportDatabase.import_march_2016
  puts "done."
end