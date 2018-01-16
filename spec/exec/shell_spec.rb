describe MeteoPl::Exec::Shell do
  describe 'proper output' do
    context 'returns error message if location does not exist' do
      # request mock instead
      before do
        allow(MeteoPl::Utility::Graph).to receive(:new).and_return(
          double('graph', uri: nil)
        )
      end

      it do
        expect($stdout).to receive(:puts).with(
        'Graph for given location does not exists'
        )
        expect_any_instance_of(MeteoPl::Utility::Presenter).not_to receive(:show)

        described_class.call
      end
    end

    context 'tiggers graph presenter if everything went fine' do
      # request mock instead
      before do
        allow(MeteoPl::Utility::Graph).to receive(:new).and_return(
          double('graph', uri: 'http://example.com/graph.png')
        )
      end

      it do
        expect($stdout).not_to receive(:puts)
        expect_any_instance_of(MeteoPl::Utility::Presenter).to receive(:show)

        described_class.call
      end
    end
  end
end
