# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :Enrollment

  has_many :enrolled_courses,
  #enrollments is a reference to the association made above: enrollments
  through: :enrollments,
  #course is a reference to the association in enrollements table: course
  source: :course



end
