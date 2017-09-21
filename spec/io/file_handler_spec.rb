describe MeteoPl::IO::FileHandler do
  let(:file_handler) { MeteoPl::IO::FileHandler.new }

  describe 'behaviour' do
    let(:tempfile) { double('tempfile') }
    before do
      allow(Tempfile).to receive(:open).and_return(tempfile)
    end
    it 'creates tempfile and yields it' do
      expect_any_instance_of(MeteoPl::IO::FileHandler).to receive(:open)
        .and_yield(tempfile)

      file_handler.open { |_| }
    end
  end
end
