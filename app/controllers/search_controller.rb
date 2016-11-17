class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @speeches = []
    else
     @speeches = Speech.search params[:q]
    end
  end
end
