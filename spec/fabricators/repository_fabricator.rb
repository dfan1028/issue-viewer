Fabricator(:repository) do
  full_name { Faker::Games::Zelda.character }
  remote_id { rand(9999) }
  user { Fabricate(:user) }
end
