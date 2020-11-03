RSpec.describe GithubService::Issue do
  let(:repository) { Fabricate(:repository) }
  let(:user) { repository.user }

  subject { described_class.new(user, repository) }

  let(:issues_payload) do
    [
      OpenStruct.new(
        id: rand(9999),
        title: Faker::Movies::HarryPotter.book,
        number: rand(999),
        created_at: (Date.today - rand(10000)).to_s,
        user: OpenStruct.new(login: 'corgi'),
        body: Faker::Movies::HarryPotter.quote,
        whatever: 'corgirocket'
      ),
      OpenStruct.new(
        pull_request: {}
      )
    ]
  end

  describe '#import_data!' do
    context 'when issues are fetched' do
      before do
        allow_any_instance_of(described_class).to receive(:remote_data)
          .and_return(issues_payload)

        subject.import_data!
      end

      it 'upserts issues and filters pull requests' do
        expect(repository.issues.count).to eq(1)
      end
    end

    context 'when there are no issues fetched' do
      before do
        allow_any_instance_of(described_class).to receive(:remote_data)
          .and_return([])
      end

      it 'does not upsert any issues' do
        subject.import_data!

        expect(repository.issues.count).to eq(0)
      end
    end
  end
end
