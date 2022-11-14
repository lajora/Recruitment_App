require 'faker'

#users
puts 'Creating users'
juan = User.create(first_name: "Juan", last_name: "Garcia",
            email: "juan.garcia@example.com", password: "foobar",
            password_confirmation: "foobar")

laura = User.create(first_name: "Laura", last_name: "Munoz",
            email: "laura.munoz@example.com", password: "foobar",
            password_confirmation: "foobar")

lucia = User.create(first_name: "Lucia", last_name: "Rodro",
            email: "lucia.rodro@example.com", password: "foobar",
            password_confirmation: "foobar")

marc = User.create(first_name: "Marc", last_name: "Reinaldo",
            email: "marc.reinaldo@example.com", password: "foobar",
            password_confirmation: "foobar")

#admins
puts 'Creating admins'
lara = User.create(first_name: "Lara", last_name: "Keen",
            email: "lara.keen@example.com", password: "foobar",
            password_confirmation: "foobar")
victor = User.create(first_name: "Victor", last_name: "Benito",
            email: "victor.benito@example.com", password: "foobar",
            password_confirmation: "foobar")

#jobs
puts 'Creating jobs'
job1 = Job.new(title: Faker::Job.title, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            location: Faker::Address.city, start_date: "14-11-2022", end_date: "25-01-2023",
            years_of_experience: rand(0..10), working_hours: "40 hours per week", 
            salary: rand(7..15), user_id: lara.id)
job1.save
job2 = Job.new(title: Faker::Job.title, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            location: Faker::Address.city, start_date: "08-01-2023", end_date: "08-03-2023",
            years_of_experience: rand(0..10), working_hours: "40 hours per week", 
            salary: rand(7..15), user_id: victor.id)
job2.save
job3 = Job.new(title: Faker::Job.title, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            location: Faker::Address.city, start_date: "23-04-2023", end_date: "25-05-2023",
            years_of_experience: rand(0..10), working_hours: "40 hours per week", 
            salary: rand(7..15), user_id: victor.id)
job3.save     
job4 = Job.new(title: Faker::Job.title, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            location: Faker::Address.city, start_date: "04-12-2022", end_date: "17-02-2023",
            years_of_experience: rand(0..10), working_hours: "40 hours per week", 
            salary: rand(7..15), user_id: lara.id)
job4.save
#job applications
puts 'Creating job applications'

job_application_1 = JobApplication.create(status: 'pending',
                    stage: 'Application recieved', user_id: juan.id, 
                    job_id: 1)

job_application_2 = JobApplication.create(status: 'pending',
                    stage: 'Application recieved', user_id: juan.id, 
                    job_id: 2)

job_application_3 = JobApplication.create(status: 'pending',
                    stage: 'Application recieved', user_id: lucia.id, 
                    job_id: 1)

job_application_4 = JobApplication.create(status: 'pending',
                    stage: 'Application recieved', user_id: marc.id, 
                    job_id: 1)
