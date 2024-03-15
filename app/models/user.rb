class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendances

  has_many :events, inverse_of: 'creator', dependent: :destroy
  # belongs_to :attended_event, class_name: 'Event', foreign_key
end
