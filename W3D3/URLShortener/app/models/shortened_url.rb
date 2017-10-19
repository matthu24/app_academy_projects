# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates  :short_url,  presence: true, uniqueness: true
  validates :user_id, :long_url, presence: true

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :visits,
  primary_key: :id,
  foreign_key: :short_id,
  class_name: :Visit

  has_many :visitors,
  -> { distinct },
  through: :visits,
  source: :visitor

  def self.random_code

      code = SecureRandom.urlsafe_base64
      while ShortenedUrl.exists?(:short_url => code)
        code = SecureRandom.urlsafe_base64
      end
      code
  end

  def self.create_short(user, long_url)
    short = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, short_url: short, long_url: long_url)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where(created_at: (Time.now - 10.minutes)..(Time.now)).count
  end



end
