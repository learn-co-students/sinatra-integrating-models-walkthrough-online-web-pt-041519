require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  
  get '/' do
    erb :index
  end
  
  get '/new' do
    erb :create_puppy
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    erb :results
  end
  
end
