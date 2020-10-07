class AddLeadToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :lead, :string
  end
end
