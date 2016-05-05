class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :student_id, presence: true

  has_many :memberships
  has_many :events, foreign_key: 'admin_id'

  enum status: %w(active blacklisted expired)
end
