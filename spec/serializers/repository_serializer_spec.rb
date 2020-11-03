RSpec.describe RepositorySerializer do
  let(:repository) { Fabricate(:repository) }
  let(:json) { JSON.parse described_class.new(repository).to_json }

  let(:filtered_keys) do
    %w( id full_name )
  end

  it 'has the correct key' do
    expect(json.keys).to include(*filtered_keys)
  end
end
