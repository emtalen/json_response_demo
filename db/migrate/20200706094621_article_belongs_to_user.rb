# frozen_string_literal: true

class ArticleBelongsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
