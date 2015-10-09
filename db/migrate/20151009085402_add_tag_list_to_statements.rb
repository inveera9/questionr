class AddTagListToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :tag_list, :string
  end
end
