# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  short_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
  validates :user_id, :short_id, presence: true

  belongs_to :visitor,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :shortened_urls,
  primary_key: :id,
  foreign_key: :short_id,
  class_name: :ShortenedUrl


  def self.record_visit!(user,shortened_url)
    Visit.create!(user_id: user.id ,short_id: shortened_url.id)
  end


end
