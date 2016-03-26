admin = User.create(email: 'admin@ssvinfo.org', password: '123123123', password_confirmation: '123123123', name: 'SSV Admin', admin: true, student_id: 1, status: 0)
admin.events.create(title: 'A Day at Grace Community Services', introduction: '', date: '2016-03-26', time: '2016-03-26 14:07:19 +0800', venue: 'Grace Community Centre', volunteering_hour: 4, 
										gathering_time: '2016-03-26 14:07:19 +0800', gathering_venue: 'Foyer Sunway', transportation: true, meal: true, certificate: true, job_scope: 'Teaching..',
										notes: 'Notess..........', volunteers_needed: 50, max_volunteers: 65
										)

student = User.create(email: 'student@ssvinfo.org', password: '123123123', password_confirmation: '123123123', name: 'SSV Student', admin: false, student_id: 2,
											identity_number: '123123123', contact_number: '123123123', course: 'A-Levels', course_intake: '2016-03-26', emergency_contact: 'Father', emergency_number: '123123123', expiry: '2017-03-15',
											status: 0, paid: true
											)
student.memberships.create(status: 'New')