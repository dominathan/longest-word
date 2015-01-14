# Given a dictionary, what is the largest word you can type using only your left hand
require_relative '../tale_of_two_cities.rb'
require 'pry'

class LargestWord
  attr_reader :hands
  attr_accessor :dictionary

  def initialize(dict)
    @dictionary = dict.split(" ")
    @hands = {left: "qwertyasdfgzxcv", right: 'uiophjklbnm'}
  end

  STRING_LITERALS = "\"\'1234567890?._!,\'"

  #Check to see if right hand can type one word
  def type_with_right_hand?(word)
    word.downcase.scan(Regexp.new("["<<hands[:left]<<STRING_LITERALS<<"]")).empty?
  end

  #Check to see if left hand can type one word
  def type_with_left_hand?(word)
    word.downcase.scan(Regexp.new("["<<hands[:right]<<STRING_LITERALS<<"]")).empty?
  end

  #loop through the dictionary, and return the largest word
  def largest_word_in_dict(dictionary, which_hand)
    largest_one_hand_word = ""
    dictionary.each do |dict_word|
      if type_with_one_hand?(which_hand, dict_word)
        if dict_word.length > largest_one_hand_word.length
          largest_one_hand_word = dict_word
        end
      end
    end
    largest_one_hand_word
  end

  private

    def type_with_one_hand?(hand,word)
      send("type_with_#{hand}_hand?".to_sym, word)
    end

end





#send("#{hand}_hand").to_sym
