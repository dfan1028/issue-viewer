RSpec.describe Repository, type: :model do
  subject { Fabricate(:repository) }

  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_presence_of(:remote_id) }
  it { is_expected.to validate_presence_of(:user_id) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:issues) }
end
