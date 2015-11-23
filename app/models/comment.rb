class Comment < ActiveRecord::Base
  belongs_to :candidate

  validates_presence_of :title, :message
  
  def self.approved
    where("status =?",true)
  end

end
