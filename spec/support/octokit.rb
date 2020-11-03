RSpec.configure do |config|
  config.before(:each) do
    allow_any_instance_of(Octokit::Client).to receive(:rate_limit).and_return(
      OpenStruct.new(remaining: 500)
    )

    allow_any_instance_of(Octokit::Client).to receive(:list_issues).and_return(
      []
    )

    allow_any_instance_of(Octokit::Client).to receive(:repos).and_return(
      []
    )
  end
end
