# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  hod                    :boolean          default(FALSE)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  department_id          :integer
#  semester_id            :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  ROLES = ['admin','faculty','student']
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :role, inclusion: { in: ROLES, message: "%{value} is not a valid role!" }

  belongs_to :department, optional: true
  belongs_to :semester, optional: true
  has_many :faculty_subjects, class_name: "FacultySubject", foreign_key: "faculty_id"
  has_many :subjects, through: :faculty_subjects, source: :user
  has_many :lectures, class_name: "Lecture", foreign_key: "faculty_id"

  # Methods -  user.admin?, user.faculty?, user.student?
  ROLES.each do |method|
    define_method "#{method}?" do
      role == method
    end
  end
end
