require_relative 'nameable_n'

class TrimmerDecorator < Nameable
  def initialize(_nameable = Nameable.new)
    super()
  end

  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..10] : @nameable.correct_name
  end
end
