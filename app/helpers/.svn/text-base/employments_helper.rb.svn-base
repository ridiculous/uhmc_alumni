module EmploymentsHelper
  def self_employed_list
    options = []
    options.push(@employment.self_employed ? %w[Yes true] : %w[No false])
    options.push(!@employment.self_employed ? %w[Yes true] : %w[No false])
  end
end
