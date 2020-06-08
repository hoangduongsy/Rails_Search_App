# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

d1 = Developer.create!(email: "nguyenvantroi@gmail.com")
l1 = Language.create!(code: "JP")
pl1 = ProgrammingLanguage.create!(name: "Ruby")

d2 = Developer.create!(email: "hoangvanminh@gmail.com")
l2 = Language.create!(code: "EN")
pl2 = ProgrammingLanguage.create!(name: "C++")

pl3 = ProgrammingLanguage.create!(name: "PHP")
pl4 = ProgrammingLanguage.create!(name: "Java")

DeveloperProgrammingLanguage.create!(developer_id: d1.id, programming_language_id: pl1.id)
DeveloperProgrammingLanguage.create!(developer_id: d1.id, programming_language_id: pl2.id)
DeveloperProgrammingLanguage.create!(developer_id: d2.id, programming_language_id: pl4.id)
DeveloperProgrammingLanguage.create!(developer_id: d2.id, programming_language_id: pl3.id)

DeveloperLanguage.create!(developer_id: d1.id,language_id: l1.id)
DeveloperLanguage.create!(developer_id: d1.id,language_id: l2.id)
DeveloperLanguage.create!(developer_id: d2.id,language_id: l1.id)
DeveloperLanguage.create!(developer_id: d2.id,language_id: l2.id) 

#Create many sample fake data
98.times do |n|
  email = Faker::Internet.email
  dev = Developer.create!(email: email)
  name = Faker::ProgrammingLanguage.name
  plang = ProgrammingLanguage.create!(name: name)
  name_2 = Faker::ProgrammingLanguage.name
  plang_2 = ProgrammingLanguage.create!(name: name_2)
  name_3 = Faker::ProgrammingLanguage.name
  plang_3 = ProgrammingLanguage.create!(name: name_3)

  lang = Language.create!(code: "EN")
  code_2 = Faker::Address.country_code
  lang_2 = Language.create!(code: code_2)
  code_3 = Faker::Address.country_code
  lang_3 = Language.create!(code: code_3)

  DeveloperProgrammingLanguage.create!(developer_id: dev.id, programming_language_id: plang.id)
  DeveloperProgrammingLanguage.create!(developer_id: dev.id, programming_language_id: plang_2.id)
  DeveloperProgrammingLanguage.create!(developer_id: dev.id, programming_language_id: plang_3.id)

  DeveloperLanguage.create!(developer_id: dev.id, language_id: lang.id)
  DeveloperLanguage.create!(developer_id: dev.id, language_id: lang_2.id)
  DeveloperLanguage.create!(developer_id: dev.id, language_id: lang_3.id)
end


