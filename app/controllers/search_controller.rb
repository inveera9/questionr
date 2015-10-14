class SearchController < ApplicationController
  
  def search
    flash[:alert] = "Please enter a candidate or event name" if params[:q].blank?&&params[:e].blank?
    @candidates = params[:q].present? ? Candidate.search(params[:q]).records.to_a : []
    @events = params[:e].present? ? Event.search(params[:e]).records.to_a : []
    @event_days = params[:d].present? ? Event.search(params[:d]).records.to_a : []
    @venues = params[:v].present? ? Venue.search(params[:v]).records.to_a : []
  end
end

