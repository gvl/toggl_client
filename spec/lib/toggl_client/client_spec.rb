require 'spec_helper'

RSpec.describe Toggl::Client do
  subject { described_class }
  let(:api_token) { 'token' }

  describe '#connection' do
    it 'contains proper headers' do
      connection = subject.connection(api_token)
      keys = %w(Accept Content-Type Authorization)
      headers = connection.headers

      expect(keys.all? { |k| headers.key?(k) }).to be_truthy
    end
  end
end
