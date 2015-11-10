class AddIssueTagToStatement < ActiveRecord::Migration
  def change
    add_column :statements, :issue_tag, :string
  end
end
