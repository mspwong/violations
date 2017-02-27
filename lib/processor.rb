require 'csv'

class Processor
  attr_reader :summary

  def initialize(data_file_path)
    @data_file_path = data_file_path
    @summary = { }
  end

  def run()
    violations = CSV.read(@data_file_path, headers: true)
    violations.each do |row|
      violation_category = row['violation_category']
      violation_date = DateTime.parse(row['violation_date'])
      if @summary.has_key?(violation_category)
        category = @summary[violation_category]
        category[:count] += 1
        if category[:earlist] > violation_date
          category[:earlist] = violation_date
        end
      else
        @summary[violation_category] = { count: 1, earlist: violation_date, latest: violation_date }
      end
    end
  end
end