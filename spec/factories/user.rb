FactoryGirl.define do
	factory :user do
		email 'admin@ssvinfo.org'
		password '123123123'
		password_confirmation '123123123'
		name 'SSV Admin'
		admin true
	end
end