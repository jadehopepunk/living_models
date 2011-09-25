require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.email { Faker::Internet.email }
Sham.name  { Faker::Name.name }

User.blueprint do
  email
  password "password"
  password_confirmation "password"
end

Category.blueprint do
  name
  description { Faker::Lorem.words(5).join(' ') }
end

Project.blueprint do
  name
  location "2 Korora Rd, Oneroa, Waiheke Island"
  region "North Island"
  category 
  summary "some summary"
  contact_email_address { Sham.email }
end