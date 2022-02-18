module Translate
  def translate_input(input)
    %w[yes y].include?(input.downcase)
  end
end