RSpec.describe OauthProvider::Github do
  let(:omniauth_params) do
    OpenStruct.new(
      info: OpenStruct.new(
        image: Faker::Internet.url,
        email: Faker::Internet.email,
        nickname: Faker::Internet.username
      ),
      credentials: OpenStruct.new(token: SecureRandom.hex(10)),
      uid: rand(999999),
      provider: 'github'
    )
  end

  let(:user) { Fabricate(:user) }

  subject { described_class.new(omniauth_params) }

  describe '#updatable_params' do
    context 'when user exists' do
      it 'returns updatable params' do
        expect(subject.updatable_params).to eq(
          {
            name: omniauth_params.info.nickname,
            email: omniauth_params.info.email,
            image_url: omniauth_params.info.image,
            auth_token: omniauth_params.credentials.token
          }
        )
      end
    end
  end

  describe '#create_or_update_user!' do
    context 'when user does not already exist' do
      before { subject.create_or_update_user! }

      it 'creates a new user' do
        expect(User.count).to eq(1)
      end
    end

    context 'when user already exists' do
      let(:rawr) { 'corgasaurus' }
      let(:different_omniauth_params) do
        omniauth_params.tap do |params|
          params.info.nickname = rawr
        end
      end

      let(:user) { Fabricate(:user, uid: different_omniauth_params.uid) }

      subject { described_class.new(different_omniauth_params) }

      before do
        user
        subject.create_or_update_user!
      end

      it 'updates existing user' do
        expect(user.reload.name).to eq(rawr)
      end
    end
  end
end
