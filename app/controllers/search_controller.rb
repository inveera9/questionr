class SearchController < ApplicationController
  
  def search
    flash[:alert] = "Please enter a candidate or event name" if params[:q].blank?&&params[:e].blank?
    @candidates = Candidate.search(params[:q]).records.to_a
    @events = Event.search(params[:e]).records.to_a
    @event_days = Event.search(params[:d]).records.to_a
    @venues = Venue.search(params[:v]).records.to_a
  end
end

