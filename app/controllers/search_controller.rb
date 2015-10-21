class SearchController < ApplicationController
  
  def search
    @statements = []
    if params[:q].blank? && params[:e].blank? && params[:v].blank? && params[:d].blank?
      flash[:alert] = "Please fill at least one field." 
    else
      flash[:alert] = nil
      @statements = Statement.advance_search(params[:q],params[:v],params[:d],params[:e])
    end
  end
end

