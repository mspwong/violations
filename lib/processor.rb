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
      if @summary.has_key?(violation_category)
        @summary[violation_category][:count] += 1
      else
        @summary[violation_category] = { count: 1 }
      end
    end
  end
end