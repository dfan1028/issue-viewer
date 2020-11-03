Fabricator(:user) do
  uid { SecureRandom.hex(8) }
  platform { 'github' }
end
