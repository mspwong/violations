require 'violations_reader'
require 'violations_summarizer'
require 'summary_writer'

class Processor
  def self.run(data_file_path, summary_file_path)
    Processor.new(data_file_path, summary_file_path).run
  end

  def initialize(data_file_path, summary_file_path)
    @data_file_path = data_file_path
    @summary_file_path = summary_file_path
  end

  def run
    violations = ViolationsReader.run(@data_file_path)
    summary = ViolationsSummarizer.run(violations, ViolationsReader::CATEGORY_HEADER, ViolationsReader::DATE_HEADER)
    SummaryWriter.run(@summary_file_path, summary)
  end
end