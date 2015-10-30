module SearchHelper

  def search_filter(statement)
    #if all params present
    if params[:q].present? && params[:v].present? && from_to? && venue(statement)
      statement.candidate.person_name.to_s.downcase.include? params[:q].downcase and statement.event_day.event.venue.name.downcase.include? params[:v].downcase and date_range(params[:from],params[:to],statement)
    #if any two params present
    elsif params[:q].present? && params[:v].present? && venue(statement)
      statement.candidate.person_name.to_s.downcase.include? params[:q].downcase and statement.event_day.event.venue.name.downcase.include? params[:v].downcase
    elsif params[:v].present? && from_to? && venue(statement)
      statement.event_day.event.venue.name.downcase.include? params[:v].downcase and date_range(params[:from],params[:to],statement)
    elsif params[:q].present? && from_to?
      statement.candidate.person_name.to_s.downcase.include? params[:q].downcase and  date_range(params[:from],params[:to],statement)    
    #if any two params present
    # elsif params[:q].present? && params[:e].present?
    #   statement.candidate.person_name.to_s.downcase.include? params[:q].downcase and  statement.event_day.present? ? (statement.event_day.event.title.downcase.include? params[:e].downcase) : false
    # elsif params[:q].present? && params[:v].present? && venue(statement)
    #   statement.candidate.person_name.to_s.downcase.include? params[:q].downcase and statement.event_day.event.venue.name.downcase.include? params[:v].downcase
    # elsif params[:q].present? && params[:d].present?
    #   statement.candidate.person_name.to_s.downcase.include? params[:q].downcase and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    # elsif params[:e].present? && params[:v].present? && venue(statement) 
    #   statement.event_day.present? ? (statement.event_day.event.title.downcase.include? params[:e].downcase) : false and statement.event_day.event.venue.name.downcase.include? params[:v].downcase
    # elsif params[:e].present? && params[:d].present? && event_day(statement)
    #   statement.event_day.present? ? (statement.event_day.event.title.downcase.include? params[:e].downcase) : false and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]
    # elsif params[:v].present? && params[:d].present? && venue(statement)
    #   statement.event_day.event.venue.name.downcase.include? params[:v].downcase and statement.event_day.date.strftime("%m/%d/%Y") == params[:d]  
    
    #if any one params present
    elsif params[:q].present?
      statement.candidate.person_name.to_s.downcase.include? params[:q].downcase
    elsif params[:v].present? && venue(statement)
      statement.event_day.event.venue.name.downcase.include? params[:v].downcase
    elsif from_to?
      date_range(params[:from],params[:to],statement)
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

  def from_to?
    params[:from].present? && params[:to].present?
  end

  def date_range(from,to,statement)
    statement.event_day.present? ? (from.to_date..to.to_date).to_a.map{|d| d.strftime("%d/%m/%Y")}.include?(statement.event_day.date.strftime("%d/%m/%Y")) : false
  end
end
