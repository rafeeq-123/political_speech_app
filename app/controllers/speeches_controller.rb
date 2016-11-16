class SpeechesController < ApplicationController

  def index
    @speeches = Speech.paginate(:page => params[:page], :per_page => 1)
  end

  def new
    @speech = Speech.new
  end

  def create
    speech_analysis
    speech = current_user.speeches.create(speech_params)
    if speech.content.content_type == "text/plain"
      ready = File.open(speech.content.current_path)
      speech.text_of_uploaded_content = ready.read
      speech.political_stats = Indico.political(speech.text_of_uploaded_content)
      speech.save!
    elsif speech.content.content_type == "application/pdf"
      reader = PDF::Reader.new(speech.content.current_path)
      reader.pages.each do |page|
        no_num_of_new_l = page.text.gsub(/[\s\n\b]/ ," ")
        no_bytes = no_num_of_new_l.force_encoding("BINARY").gsub(/#{0xA5.chr}/," ")
        speech.text_of_uploaded_content = no_bytes.unpack('A*').to_s.gsub(/\\x[A-F0-9]{2}/,"")[2..-3]
        speech.text_of_uploaded_content.chomp
        speech.political_stats = Indico.political(speech.text_of_uploaded_content)
        speech.save!
      end
    # elsif speech.content.content_type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    #     doc = Docx::Document.new(speech.content.current_path)
    #     doc.paragraphs.each do |page|
          # speech.text_of_uploaded_content = page.text.gsub("\n",'')
    #      speech.save!
    #      speech.political_stats = Indico.political(speech.text_of_uploaded_content)
    #      speech.save!
       # end
      end
      redirect_to speech_url(speech.id)
    end

  def show
    @speech = Speech.find(params[:id])
  end

  #to do list:
  # => deploy to herkou

private

  def speech_params
    params.require(:speech).permit(:name, :content, :political_stats, :text_of_uploaded_content)
  end

  def speech_analysis
    Indico.api_key = Rails.application.secrets.indico_api
  end

end