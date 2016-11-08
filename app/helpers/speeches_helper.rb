module SpeechesHelper
  def political_percents
    @speech.political_stats
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
