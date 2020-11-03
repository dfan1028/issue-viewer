RSpec.describe Issue, type: :model do
  subject { Fabricate(:issue) }

  it { is_expected.to validate_presence_of(:repository_id) }
  it { is_expected.to validate_presence_of(:remote_id) }

  it { is_expected.to belong_to(:repository) }
end
