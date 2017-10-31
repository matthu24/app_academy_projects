class Post < ApplicationRecord
  validates :title, :url, :content,presence: true
  belongs_to :sub
  belongs_to :user

end
