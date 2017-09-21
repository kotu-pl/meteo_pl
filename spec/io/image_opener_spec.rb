describe MeteoPl::IO::ImageOpener do
  let(:path) { '/tmp/graph.png'}
  let(:image_opener) do
    image_opener = described_class.new
    image_opener.path = path
    image_opener
  end

  describe 'calling proper command for given OS' do
    context 'Windows' do
      before { stub_const('RbConfig::CONFIG', 'host_os' => 'mswin') }
      it do
        expect_any_instance_of(Kernel).to receive(:`).with("start #{path}")
        image_opener.open
      end
    end
    context 'macOS' do
      before { stub_const('RbConfig::CONFIG', 'host_os' => 'darwin') }
      it do
        expect_any_instance_of(Kernel).to receive(:`).with("open #{path}")
        image_opener.open
      end
    end
    context 'linux' do
      before { stub_const('RbConfig::CONFIG', 'host_os' => 'linux') }
      it do
        expect_any_instance_of(Kernel).to receive(:`).with("xdg-open #{path}")
        image_opener.open
      end
    end
  end
end
