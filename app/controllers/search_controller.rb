class SearchController < ApplicationController
  
  def search
    @statements = []
    @statements = Statement.advance_search(params[:q],params[:v],params[:d],params[:e])
    @statements = Statement.tag_search(params[:t]) if params[:t].present?
  end
end

