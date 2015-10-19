module SearchHelper

  def search_filter(statement)
    #if all params present
    if params[:q].present? && params[:e].present? && params[:v].present? && params[:d].present? && venue(statement)
      statement.candidate.person_name.to_s.downcase.include? params[:q] and  statement.candidate.events.map(&:title).include? params[:e] and statement.event_day.event.venue.name.include? params[:v] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    #if any three params present
    elsif params[:q].present? && params[:e].present? && params[:v].present? && statement.event_day.present? && statement.event_day.event.present? && statement.event_day.event.venue.present?
      statement.candidate.person_name.to_s.downcase.include? params[:q] and  statement.candidate.events.map(&:title).include? params[:e] and statement.event_day.event.venue.name.include? params[:v]
    elsif params[:e].present? && params[:v].present? && params[:d].present? && venue(statement)
      statement.candidate.events.map(&:title).include? params[:e] and statement.event_day.event.venue.name.include? params[:v] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    elsif params[:q].present? && params[:v].present? && params[:d].present? && venue(statement)
      statement.candidate.person_name.to_s.downcase.include? params[:q] and statement.event_day.event.venue.name.include? params[:v] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    elsif params[:q].present? && params[:e].present? && params[:d].present? && event_day(statement)
      statement.candidate.person_name.to_s.downcase.include? params[:q] and  statement.candidate.events.map(&:title).include? params[:e] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]    
    #if any two params present
    elsif params[:q].present? && params[:e].present?
      statement.candidate.person_name.to_s.downcase.include? params[:q] and  statement.candidate.events.map(&:title).include? params[:e]
    elsif params[:q].present? && params[:v].present? && statement.event_day.present? && statement.event_day.event.present? && statement.event_day.event.venue.present?
      statement.candidate.person_name.to_s.downcase.include? params[:q] and statement.event_day.event.venue.name.include? params[:v]
    elsif params[:q].present? && params[:d].present?
      statement.candidate.person_name.to_s.downcase.include? params[:q] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
      byebug
    elsif params[:e].present? && params[:v].present? && venue(statement) 
      statement.candidate.events.map(&:title).include? params[:e] and statement.event_day.event.venue.name.include? params[:v]
    elsif params[:e].present? && params[:d].present? && event_day(statement)
      statement.candidate.events.map(&:title).include? params[:e] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    elsif params[:v].present? && params[:d].present? && statement.event_day.present? && statement.event_day.event.present? && statement.event_day.event.venue.present?
      statement.event_day.event.venue.name.include? params[:v] and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    #if any one params present
    elsif params[:q].present?
      statement.candidate.person_name.to_s.downcase.include? params[:q]
    elsif params[:e].present?
      statement.candidate.events.map(&:title).include? params[:e]
    elsif params[:v].present? && venue(statement)
      statement.event_day.event.venue.name.include? params[:v]
    elsif params[:d].present? && statement.event_day.present?
      statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    else
      false
    end
  end

  def venue(statement)
    statement.event_day.present? && statement.event_day.event.present? && statement.event_day.event.venue.present?
  end
  
  def event_day(statement)
    statement.event_day.present?
  end
end
