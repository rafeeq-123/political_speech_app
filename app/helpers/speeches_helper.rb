module SpeechesHelper

  def political_percents
    string_numbers = @speech.political_stats.gsub(/[\s a-zA-Z{}=>""]/ , "").split(",")
    @liberatian = string_numbers[0].to_f
    @green = string_numbers[1].to_f
    @liberal = string_numbers[2].to_f
    @converative = string_numbers[3].to_f
    #I hate this!
  end

  def index_political_percent_helper
    @speeches.each do |speech|
      formated_stats = speech.political_stats.gsub(/[\s a-zA-Z{}=>""]/ , "").split(',')
      @liberatian = formated_stats[0]
      @green = formated_stats[1]
      @liberal = formated_stats[2]
      @converative = formated_stats[3]
    #I hate this even more!!
    end
  end
end
