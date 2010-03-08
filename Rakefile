require 'lib/customs/tasks'


desc "create test csv data"
task :fake_csv do
  require 'faker'
  require 'faster_csv'
  
  FasterCSV.open("spec/fixtures/data.csv", "w") do |csv|
    20.times do
      csv << [
        Faker::Company.name, 
        Faker::Address.street_address, 
        Faker::Address.city, 
        Faker::Address.us_state_abbr, 
        Faker::Address.zip_code, 
        Faker::PhoneNumber.phone_number,
        Faker::Name.name,
        rand(10000) + 1000]
    end
  end
end