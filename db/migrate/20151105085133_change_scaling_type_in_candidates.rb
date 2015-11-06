class ChangeScalingTypeInCandidates < ActiveRecord::Migration
  def change
  	change_column :candidates, :scaling, :text
  end
end
