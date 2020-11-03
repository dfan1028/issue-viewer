Fabricator(:issue) do
  title { Faker::Movies::HarryPotter.book }
  author { Faker::Movies::HarryPotter.character }
  number { rand(999) }
  repository { Fabricate(:repository) }
  remote_id { rand(9999) }
  remote_created_at { (Date.today - rand(10000)).to_s }
  description { Faker::Movies::HarryPotter.quote }
end
