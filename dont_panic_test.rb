require "test/unit"
require_relative './dont_panic'

class DontPanicTest < Test::Unit::TestCase
  def setup
    @sentences = [
      "Don't Panic!",
      "Time is an illusion! Lunchtime doubly so.",
      "Space is big"
    ]
  end

  def test_sentence_to_array
    sentence = @sentences[1]
    result = ['time','is','an','illusion','lunchtime','doubly','so']
    assert_equal DontPanic.sentence_to_array(sentence), result
  end

  def test_sentences_to_array_of_arrays
    sentences = @sentences[0..1]
    result = [
      ['dont', 'panic'],
      ['time', 'is', 'an', 'illusion', 'lunchtime', 'doubly', 'so'],
    ]
    assert_equal DontPanic.sentences_to_array_of_arrays(sentences), result
  end

  def test_words_to_map
    result = {
      "dont"=>0,
      "panic"=>0,
      "time"=>1,
      "is"=>2,
      "an"=>1,
      "illusion"=>1,
      "lunchtime"=>1,
      "doubly"=>1,
      "so"=>1,
      "space"=>2,
      "big"=>2
    }

    assert_equal DontPanic.words_to_map(@sentences), result
  end
end