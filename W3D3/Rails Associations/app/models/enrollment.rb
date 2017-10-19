# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord

  belongs_to :course,
  #Because it's belongs_to, the primary key refers to the id in course
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Course

  belongs_to :user,
  #Because it's belongs_to, the primary key refers to the id in user
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :User

end
