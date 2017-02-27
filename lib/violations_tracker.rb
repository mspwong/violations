class ViolationsTracker
  def initialize(violations, category_key, date_key)
    @violations = violations
    @category_key = category_key
    @date_key = date_key
    @summary = { }
  end

  def run
    @violations.each do |violation|
      violation_category = violation[@category_key]
      violation_date = DateTime.parse(violation[@date_key])

      track_violation(violation_category, violation_date)
    end

    @summary
  end

  private

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
end