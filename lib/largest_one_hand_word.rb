# Given a dictionary, what is the largest word you can type using only your left hand
require_relative '../tale_of_two_cities.rb'

class LargestWord
  @dict = TALE_OF_TWO_CITIES.split(" ")
  @hand = {left: "[qwertyasdfgzxcv]", right: '[uiophjklbnm]'}

  #Check to see if one hand can type one word
  def self.type_word_with_one_hand?(which_hand,word)
    if which_hand == 'left'
      word.downcase.scan(Regexp.new(@hand[:right])).empty?
    else
      word.downcase.scan(Regexp.new(@hand[:left])).empty?
    end
  end

  #loop through the dictionary, and return the largest word
  def self.largest_word_in_dict(dictionary,which_hand)
    largest_one_hand_word = ""
    dictionary.each do |dict_word|
      if LargestWord.type_word_with_one_hand?(which_hand,dict_word)
        if dict_word.length > largest_one_hand_word.length
          largest_one_hand_word = dict_word
        end
      end
    end
    largest_one_hand_word
  end

end

