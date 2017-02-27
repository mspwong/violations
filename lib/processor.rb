require 'csv'

class Processor
  SUMMARY_HEADERS = ['Violation category', '# of violations', 'Earlist violation date', 'Latest violation date']
  SUMMARY_DATE_FORMAT = '%F %T'

  def initialize(data_file_path, summary_file_path)
    @data_file_path = data_file_path
    @summary_file_path = summary_file_path
    @summary = { }
  end

  def run()
    violations = read_violations
    violations.each do |row|
      process_violation(row)
    end

    write_summary
  end

  private

  def read_violations
    CSV.read(@data_file_path, headers: true)
  end

  def process_violation(row)
    violation_category = row['violation_category']
    violation_date = DateTime.parse(row['violation_date'])

    track_violation(violation_category, violation_date)
  end

  def track_violation(violation_category, violation_date)
    if @summary.has_key?(violation_category)
      category = @summary[violation_category]
      track_violation_count(category)
      track_violation_date(category, violation_date)
    else
      seed_violation_category(violation_category, violation_date)
    end
  end

  def seed_violation_category(violation_category, violation_date)
    @summary[violation_category] = { count: 1, earlist: violation_date, latest: violation_date }
  end

  def track_violation_count(category)
    category[:count] += 1
  end

  def track_violation_date(category, violation_date)
    if category[:earlist] > violation_date
      category[:earlist] = violation_date
    end
    if category[:latest] < violation_date
      category[:latest] = violation_date
    end
  end

  def write_summary
    CSV.open(@summary_file_path, 'wb', headers: true) do |csv|
      csv << SUMMARY_HEADERS

      @summary.each_pair do |category, data|
        csv << [category, data[:count], data[:earlist].strftime(SUMMARY_DATE_FORMAT), data[:latest].strftime(SUMMARY_DATE_FORMAT)]
      end
    end
  end
end