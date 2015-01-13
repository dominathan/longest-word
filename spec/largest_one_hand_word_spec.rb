require_relative '../lib/largest_one_hand_word.rb'

describe "LargestWord" do
  lw = LargestWord.new(TALE_OF_TWO_CITIES)

  context "when you call LargestWord.new" do
    it "should initialize a Hash of hands e.g., lw.hands[:left]" do
      expect(lw.hands.class).to eq(Hash)
      expect(lw.hands.count).to eq(2)
    end

    it 'the left hand should include qwertyasdfgzxcv' do
      expect(lw.hands[:left]).to include("qwertyasdfgzxcv")
    end

    it 'the right hand should include uiophjklbnm' do
      expect(lw.hands[:right]).to include("uiophjklbnm")
    end

    it 'should initialize a dictionary e.g., lw.dictionary' do
      expect(lw.dictionary).to_not be_nil
    end

    it 'the dictionary [for this case] should be TALE_OF_TWO_CITIES, into an array' do
      expect(lw.dictionary.last).to eq("known.\"")
      expect(lw.dictionary.first).to eq("A")
      expect(lw.dictionary.first(5)).to eq(["A", "TALE", "OF", "TWO", "CITIES"])
      expect(lw.dictionary[4001]).to eq("coach")
    end
  end

  context 'should have methods' do
    it '.type_with_right_hand?(word)' do
      expect(lw).to respond_to(:type_with_right_hand?)
    end

    it '.type_with_left_hand?(word)' do
      expect(lw).to respond_to(:type_with_left_hand?)
    end

    it 'that returns true if the hand can type the entire word' do
      expect(lw.type_with_right_hand?('kill')).to eq(true)
      expect(lw.type_with_right_hand?('uiplklj')).to eq(true)
      expect(lw.type_with_right_hand?('butnotme')).to eq(false)
      expect(lw.type_with_left_hand?('was')).to eq(true)
      expect(lw.type_with_left_hand?('qwerty')).to eq(true)
      expect(lw.type_with_left_hand?('butnotme')).to eq(false)
    end
  end

  context 'and a final method' do
    it '.largest_word_in_dict(dictionary, which_hand)' do
      expect(lw).to respond_to(:largest_word_in_dict)
    end

    it 'that returns the largest lefthanded word in Tale of Two Cities' do
      expect(lw.largest_word_in_dict(lw.dictionary,'left')).to eq("Aggerawayter?\"")
    end

    it 'that returns the largest righthand word in Tale of Two Cities' do
      expect(lw.largest_word_in_dict(lw.dictionary,'right')).to eq("\"_John_,\"")
    end
  end

end
