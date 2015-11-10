class AddTranscriptToStatement < ActiveRecord::Migration
  def change
    add_column :statements, :transcript, :text
  end
end
