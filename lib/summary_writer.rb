require 'csv'

class SummaryWriter
  SUMMARY_HEADERS = ['Violation category', '# of violations', 'Earlist violation date', 'Latest violation date']
  SUMMARY_DATE_FORMAT = '%F %T'

  def self.run(summary_file_path, summary)
    SummaryWriter.new(summary_file_path, summary).run
  end

  def initialize(summary_file_path, summary)
    @summary_file_path = summary_file_path
    @summary = summary
  end

  def run
    CSV.open(@summary_file_path, 'wb', headers: true) do |csv|
      csv << SUMMARY_HEADERS

      @summary.each_pair do |category, data|
        csv << [category, data[:count], data[:earlist].strftime(SUMMARY_DATE_FORMAT), data[:latest].strftime(SUMMARY_DATE_FORMAT)]
      end
    end
  end
end