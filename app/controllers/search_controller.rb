class SearchController < ApplicationController
  
  def search
    @videos = []
    @videos = Statement.advance_search(params[:q],params[:v],params[:d],params[:e])
    @videos = Statement.tag_search(params[:t]) if params[:t].present?
  end
end

