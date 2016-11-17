module SpeechesHelper
  def political_percents
    string_numbers = @speech.political_stats.gsub(/[\s a-zA-Z{}=>""]/ , "").split(",")
    @liberatian = string_numbers[0].to_f
    @green = string_numbers[1].to_f
    @liberal = string_numbers[2].to_f
    @converative = string_numbers[3].to_f
  end
  # def index_political_percent_helper(speech)
  #   speech.gsub(/[\s a-zA-Z{}=>""]/ , "").split(",")
  # end
end
