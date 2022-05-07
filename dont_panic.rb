class DontPanic
  class << self
    def start(file= "./quotes.json")
      quotes = File.readlines(file, chomp: true)
      words_to_map(quotes)
    end
    
    def sentence_to_array(sentence)
      sentence
      .split(' ')
      .map { |word| word.downcase.gsub(/[\'|\W$]/, '') }
    end
    
    def sentences_to_array_of_arrays(sentences)
      result = []
      sentences.each do |s|
        words = sentence_to_array(s)
        result << words
      end
      result
    end

    def words_to_map(arrays)
      result = {}
      quotes = sentences_to_array_of_arrays(arrays)
      quotes.each_with_index do |words, i|
        words.each { |word| result[word] = i }
      end
      result
    end
  end
end

puts "Getting Started -------"
puts DontPanic.start
puts "End"