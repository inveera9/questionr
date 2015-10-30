class SearchController < ApplicationController
  before_action :check_params, only: [:search]
  
  def search
    @videos = []
    @videos = Statement.advance_search(params[:q],params[:v],params[:from],params[:to])
    @videos = Statement.tag_search(params[:t]) if params[:t].present?
  end
  
  private
    def check_params
      if params[:q].present? || params[:v].present? || params[:from].present? || params[:to].present?
        true
      else
        false 
      end
    end
end

