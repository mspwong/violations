require 'processor'

describe Processor do
  describe '::run' do
    let(:data_file_path)      { 'spec/fixtures/Violations-2012.csv' }
    let(:summary_file_path)   { 'tmp/summary.csv' }
    let(:summary)             { CSV.read(summary_file_path, headers: true) }

    subject { described_class.run(data_file_path, summary_file_path) }

    before { subject }

    it 'determines and writes the violation categories' do
      expect(summary[0]['Violation category']).to eq 'Garbage and Refuse'
      expect(summary[1]['Violation category']).to eq 'Unsanitary Conditions'
      expect(summary[2]['Violation category']).to eq 'Animals and Pests'
      expect(summary[3]['Violation category']).to eq 'Building Conditions'
      expect(summary[4]['Violation category']).to eq 'Vegetation'
      expect(summary[5]['Violation category']).to eq 'Chemical Hazards'
      expect(summary[6]['Violation category']).to eq 'Biohazards'
      expect(summary[7]['Violation category']).to eq 'Air Pollutants and Odors'
      expect(summary[8]['Violation category']).to eq 'Retail Food'
    end
    
    it 'tracks and writes the violations count for each category' do
      expect(summary[0]['# of violations']).to eq '126'
      expect(summary[1]['# of violations']).to eq '83'
      expect(summary[2]['# of violations']).to eq '180'
      expect(summary[3]['# of violations']).to eq '62'
      expect(summary[4]['# of violations']).to eq '67'
      expect(summary[5]['# of violations']).to eq '17'
      expect(summary[6]['# of violations']).to eq '7'
      expect(summary[7]['# of violations']).to eq '2'
      expect(summary[8]['# of violations']).to eq '1'
    end

    it 'tracks and writes the earlist violation date for each category' do
      expect(summary[0]['Earlist violation date']).to eq '2012-01-03 00:00:00'
      expect(summary[1]['Earlist violation date']).to eq '2012-01-03 00:00:00'
      expect(summary[2]['Earlist violation date']).to eq '2012-01-03 00:00:00'
      expect(summary[3]['Earlist violation date']).to eq '2012-01-12 00:00:00'
      expect(summary[4]['Earlist violation date']).to eq '2012-02-01 00:00:00'
      expect(summary[5]['Earlist violation date']).to eq '2012-02-08 00:00:00'
      expect(summary[6]['Earlist violation date']).to eq '2012-04-13 00:00:00'
      expect(summary[7]['Earlist violation date']).to eq '2012-12-05 00:00:00'
      expect(summary[8]['Earlist violation date']).to eq '2012-12-20 00:00:00'
    end

    it 'tracks and writes the latest violation date for each category' do
      expect(summary[0]['Latest violation date']).to eq '2012-12-21 00:00:00'
      expect(summary[1]['Latest violation date']).to eq '2012-12-19 00:00:00'
      expect(summary[2]['Latest violation date']).to eq '2012-12-28 00:00:00'
      expect(summary[3]['Latest violation date']).to eq '2012-12-26 00:00:00'
      expect(summary[4]['Latest violation date']).to eq '2012-12-05 00:00:00'
      expect(summary[5]['Latest violation date']).to eq '2012-12-06 00:00:00'
      expect(summary[6]['Latest violation date']).to eq '2012-12-18 00:00:00'
      expect(summary[7]['Latest violation date']).to eq '2012-12-19 00:00:00'
      expect(summary[8]['Latest violation date']).to eq '2012-12-20 00:00:00'
    end
  end
end