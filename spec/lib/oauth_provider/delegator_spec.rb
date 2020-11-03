RSpec.describe OauthProvider::Delegator do
  let(:omniauth_params) { OpenStruct.new(provider: 'github') }

  subject { described_class.new(omniauth_params) }

  describe '#provider_service' do
    context 'when provider is github' do
      it 'returns the correct service' do
        expect(subject.provider_service.class).to be(OauthProvider::Github)
      end
    end

    context 'when provider is unsupported' do
      let(:omniauth_params) { OpenStruct.new(provider: 'corgirocket') }

      it 'raises error' do
        expect {
          subject.provider_service
        }.to raise_error(OauthProvider::Delegator::UnsupportedProvider)
      end
    end
  end
end
