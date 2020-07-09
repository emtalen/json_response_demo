class Article < ApplicationRecord
  validates_presence_of :title, :body

  belongs_to :author, class_name: 'User'
  has_many :comments
end