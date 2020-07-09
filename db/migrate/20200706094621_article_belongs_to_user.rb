# frozen_string_literal: true

class ArticleBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :author_id, :integer, null: false, foreign_key: true
  end
end
