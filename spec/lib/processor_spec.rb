require 'processor'

describe Processor do
  describe '#run' do
    let(:data_file_path)      { 'spec/fixtures/Violations-2012.csv' }
    let(:summary_categories)  { subject.summary.keys }
    let(:summary_data)        { subject.summary.values }

    subject { described_class.new(data_file_path) }

    before { subject.run }

    it 'determines the violation categories' do
      expect(summary_categories[0]).to eq 'Garbage and Refuse'
      expect(summary_categories[1]).to eq 'Unsanitary Conditions'
      expect(summary_categories[2]).to eq 'Animals and Pests'
      expect(summary_categories[3]).to eq 'Building Conditions'
      expect(summary_categories[4]).to eq 'Vegetation'
      expect(summary_categories[5]).to eq 'Chemical Hazards'
      expect(summary_categories[6]).to eq 'Biohazards'
      expect(summary_categories[7]).to eq 'Air Pollutants and Odors'
      expect(summary_categories[8]).to eq 'Retail Food'
    end
    
    it 'tracks the violations count for each category' do
      expect(summary_data[0][:count]).to eq 126
      expect(summary_data[1][:count]).to eq 83
      expect(summary_data[2][:count]).to eq 180
      expect(summary_data[3][:count]).to eq 62
      expect(summary_data[4][:count]).to eq 67
      expect(summary_data[5][:count]).to eq 17
      expect(summary_data[6][:count]).to eq 7
      expect(summary_data[7][:count]).to eq 2
      expect(summary_data[8][:count]).to eq 1
    end

    it 'tracks the earlist violation date for each category' do
      expect(summary_data[0][:earlist]).to eq DateTime.parse('2012-01-03 00:00:00')
      expect(summary_data[1][:earlist]).to eq DateTime.parse('2012-01-03 00:00:00')
      expect(summary_data[2][:earlist]).to eq DateTime.parse('2012-01-03 00:00:00')
      expect(summary_data[3][:earlist]).to eq DateTime.parse('2012-01-12 00:00:00')
      expect(summary_data[4][:earlist]).to eq DateTime.parse('2012-02-01 00:00:00')
      expect(summary_data[5][:earlist]).to eq DateTime.parse('2012-02-08 00:00:00')
      expect(summary_data[6][:earlist]).to eq DateTime.parse('2012-04-13 00:00:00')
      expect(summary_data[7][:earlist]).to eq DateTime.parse('2012-12-05 00:00:00')
      expect(summary_data[8][:earlist]).to eq DateTime.parse('2012-12-20 00:00:00')
    end
  end
end