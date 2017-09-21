describe MeteoPl::Net::Http do
  let(:timeout) { 2 }
  let(:http) { MeteoPl::Net::Http.new(timeout) }
  let(:url) { URI.parse('http://example.com') }

  describe 'arguments validation' do
    it 'raises error when no block given' do
      expect {
        http.fetch(url)
      }.to raise_error ArgumentError
    end
  end

  describe 'return proper data' do
    it 'body', vcr: 'example_com' do
      expect(
        http.fetch(url) { |respone| [respone.code, respone.body] }
      ).to match_array ['200', /Example Domain/]
    end
  end
end
