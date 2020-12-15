Faker::Config.locale = :ru

User.create(email: 'admin@example.com', password: 'admin_password', last_name: Faker::Name.male_last_name, first_name:
  Faker::Name.male_first_name, middle_name: Faker::Name.male_middle_name, role: 2)

User.create(email: 'employee@example.com', password: 'employee_password', last_name: Faker::Name.male_last_name,
            first_name: Faker::Name.male_first_name, middle_name: Faker::Name.male_middle_name, role: 1)

User.create(email: 'dweller1@example.com', password: 'dweller1_password', last_name: Faker::Name.male_last_name,
            first_name: Faker::Name.male_first_name, middle_name: Faker::Name.male_middle_name, role: 0)

User.create(email: 'dweller2@example.com', password: 'dweller2_password', last_name: Faker::Name.male_last_name,
            first_name: Faker::Name.male_first_name, middle_name: Faker::Name.male_middle_name, role: 0)

User.create(email: 'dweller3@example.com', password: 'dweller3_password', last_name: Faker::Name.male_last_name,
            first_name: Faker::Name.male_first_name, middle_name: Faker::Name.male_middle_name, role: 0)

WaterMeterReading.create(hot: rand(1000..10_000.0).floor(3), cold: rand(1000..10_000.0).floor(3),
                         user: User.dweller.first)
WaterMeterReading.create(hot: rand(1000..10_000.0).floor(3), cold: rand(1000..10_000.0).floor(3),
                         user: User.dweller.first)
WaterMeterReading.create(hot: rand(1000..10_000.0).floor(3), cold: rand(1000..10_000.0).floor(3),
                         user: User.dweller.first)

WaterMeterReading.create(created_at: Time.now - 1.months, hot: rand(1000..10_000.0).floor(3),
                         cold: rand(1000..10_000.0).floor(3), user: User.dweller.second)
WaterMeterReading.create(created_at: Time.now - 1.months, hot: rand(1000..10_000.0).floor(3),
                         cold: rand(1000..10_000.0).floor(3), user: User.dweller.second)
WaterMeterReading.create(created_at: Time.now - 1.months, hot: rand(1000..10_000.0).floor(3),
                         cold: rand(1000..10_000.0).floor(3), user: User.dweller.second)

WaterMeterReading.create(created_at: Time.now - 2.months, hot: rand(1000..10_000.0).floor(3),
                         cold: rand(1000..10_000.0).floor(3), user: User.dweller.last)
WaterMeterReading.create(created_at: Time.now - 2.months, hot: rand(1000..10_000.0).floor(3),
                         cold: rand(1000..10_000.0).floor(3), user: User.dweller.last)
WaterMeterReading.create(created_at: Time.now - 2.months, hot: rand(1000..10_000.0).floor(3),
                         cold: rand(1000..10_000.0).floor(3), user: User.dweller.last)
