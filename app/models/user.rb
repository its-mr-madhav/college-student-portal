class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  belongs_to :department, optional: true
  belongs_to :semester, optional: true
  has_many :faculty_subjects, class_name: "FacultySubject", foreign_key: "faculty_id"
  has_many :subjects, through: :faculty_subjects
end
