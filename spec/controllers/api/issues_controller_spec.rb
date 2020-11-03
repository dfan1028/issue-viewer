RSpec.describe API::IssuesController, type: :controller do
  let(:issue) { Fabricate(:issue) }
  let(:repository) { Fabricate(:repository) }

  describe '#index' do
    context 'when fetch is attempted and no issues exist' do
      after do
        get :index,
          params: { repo_id: repository.id },
          session: { user_id: repository.user_id }
      end

      it 'fetches remote issues' do
        expect_any_instance_of(GithubService::Issue).to receive(:import_data!)
      end
    end

    context 'when no issues exist' do
      before do
        get :index,
          params: { repo_id: repository.id },
          session: { user_id: repository.user_id }
      end

      it 'is successful' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns empty' do
        expect(JSON.parse(response.body)['issues']).to be_empty
      end
    end

    context 'when fetch is not attempted when issue exist' do
      after do
        get :index,
          params: { repo_id: issue.repository_id },
          session: { user_id: issue.repository.user_id }
      end

      it 'does not fetch issues' do
        expect_any_instance_of(GithubService::Issue).to_not receive(:import_data!)
      end
    end

    context 'when issues exist' do
      before do
        get :index,
          params: { repo_id: issue.repository_id },
          session: { user_id: issue.repository.user_id }
      end

      it 'is successful' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns issues' do
        expect(JSON.parse(response.body)['issues'].any?).to eq(true)
      end

      it 'includes pagination data' do
        expect(JSON.parse(response.body)['meta']).to be_present
      end
    end
  end

  describe '#show' do
    context 'when unauthenticated' do
      before do
        get :show, params: { id: issue.id }
      end

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when authenticated' do
      before do
        get :show,
          params: { id: issue.id },
          session: { user_id: issue.repository.user_id }
      end

      it 'is successful' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a valid payload' do
        expect(JSON.parse(response.body)['id']).to eq(issue.id)
      end
    end
  end
end
