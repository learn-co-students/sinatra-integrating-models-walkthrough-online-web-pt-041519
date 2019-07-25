require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @count = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    @most_used = @analyzed_text.most_used_letter
    @most_used_key = @most_used.keys.join
    @most_used_value = @most_used[@most_used_key]
    @upcase = @most_used_key.upcase
    erb :results
  end
end
