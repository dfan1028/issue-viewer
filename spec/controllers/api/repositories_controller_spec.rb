RSpec.describe API::RepositoriesController, type: :controller do
  let(:repository) { Fabricate(:repository) }

  describe '#index' do
    context 'when authenticated' do
      before do
        get :index, session: { user_id: repository.user_id }
      end

      it 'is successful' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns repository data' do
        expect(JSON.parse(response.body)['repositories'].any?).to eq(true)
      end

      it 'includes pagination data' do
        expect(JSON.parse(response.body)['meta']).to be_present
      end
    end

    context 'when unauthenticated' do
      before { get :index }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
