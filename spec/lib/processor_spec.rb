require 'processor'

describe Processor do
  describe '::run' do
    let(:data_file_path)  { 'spec/fixtures/Violations-2012.csv' }
    let(:summary)         { subject.summary.keys }

    subject { described_class.new(data_file_path) }

    before { subject.run }

    it 'determines the violation categories' do
      expect(summary[0]).to eq 'Garbage and Refuse'
      expect(summary[1]).to eq 'Unsanitary Conditions'
      expect(summary[2]).to eq 'Animals and Pests'
      expect(summary[3]).to eq 'Building Conditions'
      expect(summary[4]).to eq 'Vegetation'
      expect(summary[5]).to eq 'Chemical Hazards'
      expect(summary[6]).to eq 'Biohazards'
      expect(summary[7]).to eq 'Air Pollutants and Odors'
      expect(summary[8]).to eq 'Retail Food'
    end
  end
end