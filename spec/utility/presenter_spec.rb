describe MeteoPl::Utility::Presenter do
  let(:net_fetcher) { MeteoPl::Net::Http.new(2) }
  let(:file_handler) { MeteoPl::IO::FileHandler.new }
  let(:image_opener) { MeteoPl::IO::ImageOpener.new }
  let(:graph) {
    MeteoPl::Utility::MobileMeteoGraph.new(net_fetcher, 'Warszawa', 60)
  }
  let(:presenter) do
    MeteoPl::Utility::Presenter.new(
      net_fetcher, file_handler, image_opener, graph
    )
  end
  let(:tempfile) do
    double('tempfile', path: '/tmp/temfile_path.png')
  end
  before do
    allow(file_handler).to receive(:open).and_yield(tempfile)
    stub_const('RbConfig::CONFIG', 'host_os' => 'linux')
  end

  describe 'return proper data' do
    before do
      stub_request(
        :get,
        "http://m.meteo.pl/search/pl?miastoPL=Warszawa&prognozaPL=60&typePL=city"
      ).to_return(:status => 200, :body => resp1, :headers => {})
    end
    it 'opens file with OS supported image browser' do
      binding.pry
      expect_any_instance_of(Kernel).to receive(:`).with(
        "xdg-open /tmp/temfile_path.png"
      )
      expect(tempfile).to receive(:write).with(png_file.read)

      presenter.show
    end
  end
end
