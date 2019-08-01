class TextAnalyzer
    attr_reader :text, :words, :word_count

  def initialize(text)
    @text = text.downcase
    cleaned = @text.gsub(/[^A-Za-z ]/,"")
    @words = cleaned.split(" ")
    @word_count = words.length
  end

  def count_of_vowels
    @text.scan(/[aeiou]/).count
  end

  def count_of_consonants
    @words.join("").scan(/[^aeiou]/).count
  end

  def most_used_letter
    max_count = 0
    top_letter = nil
    count_hash = {}
    @words.join("").split("").each do |w|
      count_hash[w].nil? ? count_hash[w] = 1 : count_hash[w] += 1
      if count_hash[w] >= max_count
        top_letter = w
        max_count = count_hash[w]
      end
    end
    {top_letter.upcase => max_count}
  end
  end