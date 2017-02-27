require 'csv'

class ViolationsReader
  CATEGORY_HEADER = 'violation_category'
  DATE_HEADER = 'violation_date'

  def initialize(data_file_path)
    @data_file_path = data_file_path
  end

  def run
    CSV.read(@data_file_path, headers: true)
  end
end
