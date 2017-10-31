class Plan < ApplicationRecord
validates :body, presence: true
belongs_to :user
has_many :comments, dependent: :destroy
end