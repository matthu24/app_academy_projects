class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: 'Cat'

  def overlapping_requests
    #find all cat requests that share same cat_id
    #three scenarios
    #one: request_start < startdate AND request_end > end_date
    #where request_start is in between start and end
    #where request end is in between
    CatRentalRequest.where.not("start_date > :end_date OR end_date < :start_date",start_date: self.start_date, end_date: self.end_date)
                      .where("cat_id: self.cat_id")
  end

end
