RSpec.describe IssueSerializer do
  let(:issue) { Fabricate(:issue) }
  let(:json) { JSON.parse described_class.new(issue).to_json }

  let(:filtered_keys) do
    %w(
      id
      title
      author
      number
      remote_created_at
      description
    )
  end

  it 'has the correct key' do
    expect(json.keys).to include(*filtered_keys)
  end
end
