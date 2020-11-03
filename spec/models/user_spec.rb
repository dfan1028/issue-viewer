RSpec.describe User, type: :model do
  subject { Fabricate(:user) }

  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_presence_of(:platform) }

  it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:platform) }

  it { is_expected.to have_many(:repositories) }
  it { is_expected.to have_many(:issues).through(:repositories) }

  describe '#import_repo_data' do
    context 'after_create' do
      subject { Fabricate.build(:user) }

      it 'runs callback' do
        expect(subject).to receive(:import_repo_data)
        subject.save
      end
    end
  end
end
