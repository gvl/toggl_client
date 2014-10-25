require 'spec_helper'

RSpec.describe Toggl::Client do
  subject { described_class.new(api_token) }
  let(:api_token) { 'token' }

  describe '#connection' do
    it 'contains proper headers' do
      keys = %w(Accept Content-Type Authorization)
      headers = subject.headers

      expect(keys.all? { |k| headers.key?(k) }).to be_truthy
    end
  end
end
