module SpeechesHelper
  def political_percents
    binding.pry
    string_numbers = @speech.political_stats.gsub(/[\s aocservtivenLbClG{}=>""]/ , "").split(",")
    @liberatian = string_numbers[0].to_f
    @green = string_numbers[1].to_f
    @liberal = string_numbers[2].to_f
    @converative = string_numbers[3].to_f
    # need to find a way to make this nice!
  end

  # def index_logic
  #   binding.pry
  #   @speeches.each do |speech|
  #     content_tag(:strong,speech.name)
  #     if speech.text_of_uploaded_content.nil?
  #       "No content available"
  #     else
  #       speech.text_of_uploaded_content
  #       content_tag :label do speech.political_stats
  #       end
  #     end
  #   end
   end
