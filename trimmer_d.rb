require_relative nameable_n

class Trimmer_Decorator < Nameable
  def initialize(_nameable = Nameable.new)
    super()
  end

  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..10] : @nameable.correct_name
  end
end
