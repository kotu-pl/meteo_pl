require './lib/meteo_pl/utility/command'

describe MeteoPl::Utility::Command do
  let(:command_line_parser) { MeteoPl::Utility::Command.new(args) }
  before { allow($stdout).to receive(:puts) }

  describe 'arguments validation' do
    context 'valid arguments are provided' do
      let(:args) { %w[Warszawa -t 60 -p long] }

      it 'retun valid state' do
        expect(command_line_parser.call).to eq true
      end
    end

    context 'valid when only required arguments are passed' do
      let(:args) { %w[Kostrzyn nad Odrą ] }

      it 'retun valid state' do
        expect(command_line_parser.call).to eq true
      end
    end

    context 'invalid when timeout parameter is not valid' do
      let(:args) { %w[Warszawa -t 61] }

      it 'retun invalid state' do
        expect(command_line_parser.call).to eq false
      end
    end

    context 'invalid when period parameter is not valid' do
      let(:args) { %w[Warszawa -t 1 -p  other] }

      it 'retun invalid state' do
        expect(command_line_parser.call).to eq false
      end
    end
  end

  describe 'return proper data' do
    context 'return defaults' do
      let(:args) { %w[Kostrzyn nad Odrą] }

      it do
        command_line_parser.call
        expect(command_line_parser.location).to eq 'Kostrzyn nad Odrą'
        expect(command_line_parser.options).to eq({ timeout: 2, period: 60 })
      end
    end

    context 'return given options' do
      let(:args) { %w[Kostrzyn nad Odrą -t 15 -p long] }

      it do
        command_line_parser.call
        expect(command_line_parser.location).to eq 'Kostrzyn nad Odrą'
        expect(command_line_parser.options).to eq({ timeout: 15, period: 84 })
      end
    end
  end
end
