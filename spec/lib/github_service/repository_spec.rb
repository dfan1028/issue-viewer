RSpec.describe GithubService::Repository do
  let(:user) { Fabricate(:user) }

  subject { described_class.new(user) }

  let(:repos_payload) do
    Array.new.tap do |arry|
      2.times do
        arry <<
          OpenStruct.new(
            id: rand(9999),
            full_name: Faker::Games::Zelda.character
          )
      end
    end
  end

  describe '#import_data!' do
    context 'when repos are fetched' do
      before do
        allow_any_instance_of(described_class).to receive(:remote_data)
          .and_return(repos_payload)

        subject.import_data!
      end

      it 'upserts repos and filters pull requests' do
        expect(user.repositories.count).to eq(2)
      end
    end

    context 'when there are no repos fetched' do
      before do
        allow_any_instance_of(described_class).to receive(:remote_data)
          .and_return([])
      end

      it 'does not upsert any repos' do
        subject.import_data!

        expect(user.repositories.count).to eq(0)
      end
    end
  end
end
