# frozen_string_literal: true

# Collections of User Inputs
module UserInputs
  def enter_mark_location
    loop do
      choices = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]

      print 'Enter the location you want to mark (ex: a1, c2): '
      location = gets.chomp

      return location if choices.include?(location)

      puts 'Invalid Input, Try Again'
    end
  end
end

def input_player_name(num)
  print "Player #{num}, Please enter your nickname: "
  gets.chomp
end
