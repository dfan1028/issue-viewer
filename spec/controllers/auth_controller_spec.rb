RSpec.describe AuthController, type: :controller do
  let(:user) { Fabricate(:user) }

  describe '#authenticate' do
    context 'for github auth' do
      before do
        allow_any_instance_of(described_class).to receive(:provider_service)
          .and_return(
            OpenStruct.new('create_or_update_user!' => user)
          )

        get :authenticate, params: { provider: 'github' }
      end

      it 'sets user_id in session' do
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to root' do
        expect(response).to redirect_to(:root)
      end
    end
  end

  describe '#failure' do
    before { get :failure }

    it 'redirects to root' do
      expect(response).to redirect_to(:root)
    end
  end

  describe '#logout' do
    before { get :logout, session: { user_id: user.id } }

    it 'resets session' do
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to root' do
      expect(response).to redirect_to(:root)
    end
  end
end
