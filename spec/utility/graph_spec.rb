describe MeteoPl::Utility::MobileMeteoGraph do
  let(:net_fetcher) { MeteoPl::Net::Http.new(2) }
  let(:city) { 'Warszawa' }
  let(:period) { 60 }
  let(:graph) {
    MeteoPl::Utility::MobileMeteoGraph.new(net_fetcher, city, period)
  }

  describe 'return proper data' do
    before do
      stub_request(
        :get,
        "http://m.meteo.pl/search/pl?miastoPL=Warszawa&prognozaPL=60&typePL=city"
      ).to_return(
        :status => 302, :headers => { location: 'http://m.meteo.pl/warszawa/60' }
      )
      stub_request(
        :get, "http://m.meteo.pl/warszawa/60",
      ).to_return(
        status: 200, body: resp1
      )
    end

    it do
      expect(graph.uri).to be_kind_of URI
      expect(graph.uri.path).to eq '/um/metco/mgram_pict.php'
    end
  end
end
