require 'csv'
require 'byebug'

class ImportDatabase
	def self.import_march_2015
		csv_text = File.read("#{Rails.root}/app/assets/files/SSV March 2015.csv")
		csv = CSV.parse(csv_text, headers: true)
		csv.each do |row|
			user = User.find_or_initialize_by(email: row[5])
			user.password = '123123123'
			user.password_confirmation = '123123123'
			user.student_id = row[1] unless row[1].nil?
			user.name = row[2] unless row[2].nil?
			user.identity_number = row[3] unless row[3].nil?
			user.contact_number = row[4] unless row[4].nil?
			user.course = row[7] unless row[7].nil?
			unless row[8].nil?
				new_date_array = row[8].split('/') 
				new_date = "#{new_date_array[1]}/#{new_date_array[0]}/#{new_date_array[2]}"
				user.course_intake = new_date.to_date
			end
			unless row[9].nil?
	 			if row[9].include?('New')
					user.memberships.new(status: 'New')
				else
					user.memberships.new(status: 'Renew')
				end
			end
			user.emergency_contact = row[10] unless row[10].nil?
			user.emergency_number = row[11] unless row[11].nil?
			user.expiry = Date.new(2016, 3, 15)
			Date.today >= Date.new(2016, 3, 15) ? user.status = 2 : user.status = 0
			user.save
		end
	end

	def self.import_august_2015
		csv_text = File.read("#{Rails.root}/app/assets/files/SSV August 2015.csv")
		csv = CSV.parse(csv_text, headers: true)
		csv.each do |row|
			user = User.find_or_initialize_by(email: row[5])
			user.password = '123123123'
			user.password_confirmation = '123123123'
			user.student_id = row[1]
			user.name = row[2]
			user.identity_number = row[3]
			user.contact_number = row[4]
			user.course = row[7]
			new_date_array = row[8].split('/')
			new_date = "#{new_date_array[1]}/#{new_date_array[0]}/#{new_date_array[2]}"
			user.course_intake = new_date.to_date
 			if row[9].include?('New')
				user.memberships.new(status: 'New')
			else
				user.memberships.new(status: 'Renew')
			end
			user.emergency_contact = row[10]
			user.emergency_number = row[11]
			user.expiry = Date.new(2016, 8, 15)
			Date.today >= Date.new(2016, 8, 15) ? user.status = 2 : user.status = 0
			user.save
		end
	end

	def self.import_march_2016
		csv_text = File.read("#{Rails.root}/app/assets/files/SSV March 2016.csv")
		csv = CSV.parse(csv_text, headers: true)
		csv.each do |row|
			user = User.find_or_initialize_by(email: row[5])
			user.password = '123123123'
			user.password_confirmation = '123123123'
			user.student_id = row[1]
			user.name = row[2]
			user.identity_number = row[3]
			user.contact_number = row[4]
			user.course = row[7]
			new_date_array = row[8].split('/')
			new_date = "#{new_date_array[1]}/#{new_date_array[0]}/#{new_date_array[2]}"
			user.course_intake = new_date.to_date
 			if row[9].include?('New')
				user.memberships.new(status: 'New')
			else
				user.memberships.new(status: 'Renew')
			end
			user.emergency_contact = row[10]
			user.emergency_number = row[11]
			user.expiry = Date.new(2017, 3, 15)
			Date.today >= Date.new(2017, 3, 15) ? user.status = 2 : user.status = 0
			user.save
		end
	end
end