require_relative './nameable_n'

class CapitalizeDecorator < Nameable
  def initialize(nameable = Nameable.new)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.Capitalize
  end
end
