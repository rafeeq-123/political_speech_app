class SpeechesController < ApplicationController

  def index
    @speeches = Speech.reorder('created_at DESC').paginate(:page => params[:page], :per_page => 1)
    # all_comments
  end

  def new
    @speech = Speech.new
    @comments = @speech.comments.build
  end

  def create
    speech_analysis
    binding.pry
    speech = current_user.speeches.create(speech_params)
    if speech.content.content_type == "text/plain"
      ready = File.open(speech.content.current_path)
      speech.text_of_uploaded_content = ready.read
      speech.political_stats = Indico.political(speech.text_of_uploaded_content)
      speech.save!
    elsif speech.content.content_type == "application/pdf"
      reader = PDF::Reader.new(speech.content.current_path)
      reader.pages.each do |page|
        doc_into_text = page.text.gsub(/[\s\n\b]/ ," ")
        no_bytes = doc_into_text.unpack('A*').to_s.gsub(/\\x[A-F0-9]{2}/,"")[2..-3]
        into_array = no_bytes.split(',')
        speech.text_of_uploaded_content = into_array.reject(&:empty?)
        speech.political_stats = Indico.political(speech.text_of_uploaded_content.to_s.gsub(/[\s ,\[]""]/ , ""))
        speech.save!
        #possibly adding the same process into a method and adding it to docx
      end
     # elsif
        # render 'all_comments'
        # this line is not going to work forever I am going to need to think of a better way to do this...
        # respond_to do |format|
        #   if speech.save
        #     flash[:notice] = 'Comment added!'
        #     format.js
        #     format.html
        #   end
        #     format.json { render json: speech.comments.to_json }

        # end
    # elsif speech.content.content_type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    #     doc = Docx::Document.new(speech.content.current_path)
    #     doc.paragraphs.each do |page|
    #       speech.text_of_uploaded_content = page.text.gsub("\n",'')
    #      speech.save!
    #      speech.political_stats = Indico.political(speech.text_of_uploaded_content)
    #      speech.save!
    #     end
      end
      redirect_to speech_url(speech.id)
    end

  def show
    @speech = Speech.find(params[:id])
  end
  #to do
  # => omniauth
  # => scope method (most commented)
  # => elasticsearch
  # => has many likes
  # => fix search with trey
  # => maybe use this in assesment


private

  def speech_params
    params.require(:speech).permit(:name, :content, :political_stats, :text_of_uploaded_content, comment_ids:[], comments_attributes: [:title, :comment])
  end

  def speech_analysis
    Indico.api_key = Rails.application.secrets.indico_api
  end

  def all_comments
    @speech = Speech.new
    @comments = @speech.comments.build
  end

end