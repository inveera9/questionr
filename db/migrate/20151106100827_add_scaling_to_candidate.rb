class AddScalingToCandidate < ActiveRecord::Migration
  def change
  	add_column :candidates, :scaling, :text
  end
end
