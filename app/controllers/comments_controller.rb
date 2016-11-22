class CommentsController < ApplicationController
  def index
    @speech = Speech.all
  end

end
