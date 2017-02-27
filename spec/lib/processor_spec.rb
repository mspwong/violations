require 'processor'

describe Processor do
  describe '#run' do
    let(:data_file_path)      { 'spec/fixtures/Violations-2012.csv' }
    let(:summary_file_path)   { 'tmp/summary.csv' }
    let(:summary)             { CSV.read(summary_file_path, headers: true) }

    subject { described_class.new(data_file_path, summary_file_path) }

    before { subject.run }

    it 'determines and writes the violation categories' do
      expect(summary[0][0]).to eq 'Garbage and Refuse'
      expect(summary[1][0]).to eq 'Unsanitary Conditions'
      expect(summary[2][0]).to eq 'Animals and Pests'
      expect(summary[3][0]).to eq 'Building Conditions'
      expect(summary[4][0]).to eq 'Vegetation'
      expect(summary[5][0]).to eq 'Chemical Hazards'
      expect(summary[6][0]).to eq 'Biohazards'
      expect(summary[7][0]).to eq 'Air Pollutants and Odors'
      expect(summary[8][0]).to eq 'Retail Food'
    end
    
    it 'tracks and writes the violations count for each category' do
      expect(summary[0][1]).to eq '126'
      expect(summary[1][1]).to eq '83'
      expect(summary[2][1]).to eq '180'
      expect(summary[3][1]).to eq '62'
      expect(summary[4][1]).to eq '67'
      expect(summary[5][1]).to eq '17'
      expect(summary[6][1]).to eq '7'
      expect(summary[7][1]).to eq '2'
      expect(summary[8][1]).to eq '1'
    end

    it 'tracks and writes the earlist violation date for each category' do
      expect(summary[0][2]).to eq '2012-01-03 00:00:00'
      expect(summary[1][2]).to eq '2012-01-03 00:00:00'
      expect(summary[2][2]).to eq '2012-01-03 00:00:00'
      expect(summary[3][2]).to eq '2012-01-12 00:00:00'
      expect(summary[4][2]).to eq '2012-02-01 00:00:00'
      expect(summary[5][2]).to eq '2012-02-08 00:00:00'
      expect(summary[6][2]).to eq '2012-04-13 00:00:00'
      expect(summary[7][2]).to eq '2012-12-05 00:00:00'
      expect(summary[8][2]).to eq '2012-12-20 00:00:00'
    end

    it 'tracks and writes the latest violation date for each category' do
      expect(summary[0][3]).to eq '2012-12-21 00:00:00'
      expect(summary[1][3]).to eq '2012-12-19 00:00:00'
      expect(summary[2][3]).to eq '2012-12-28 00:00:00'
      expect(summary[3][3]).to eq '2012-12-26 00:00:00'
      expect(summary[4][3]).to eq '2012-12-05 00:00:00'
      expect(summary[5][3]).to eq '2012-12-06 00:00:00'
      expect(summary[6][3]).to eq '2012-12-18 00:00:00'
      expect(summary[7][3]).to eq '2012-12-19 00:00:00'
      expect(summary[8][3]).to eq '2012-12-20 00:00:00'
    end
  end
end