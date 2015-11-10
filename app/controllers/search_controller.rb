class SearchController < ApplicationController
  before_action :check_params, only: [:search]
  
  def search
    @videos = []
    @videos = Statement.advance_search(params[:q],params[:v],params[:from],params[:to],params[:i_tag])
    @videos = Statement.tag_search(params[:t]) if params[:t].present?
  end

  def search_candidate
    @candidate = Candidate.includes(:campaign).find(params[:id])
    @videos = @candidate.statements.approved
  end
  
  private
    def check_params
      if params[:q].present? || params[:v].present? || params[:from].present? || params[:to].present? || params[:i_tag].present?
        true
      else
        false 
      end
    end
end

