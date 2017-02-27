require 'violations_reader'
require 'violations_tracker'
require 'summary_writer'

class Processor
  def initialize(data_file_path, summary_file_path)
    @data_file_path = data_file_path
    @summary_file_path = summary_file_path
  end

  def run
    violations = ViolationsReader.new(@data_file_path).run
    summary = ViolationsTracker.new(violations, ViolationsReader::CATEGORY_HEADER, ViolationsReader::DATE_HEADER).run
    SummaryWriter.new(@summary_file_path, summary).run
  end
end