class User < ActiveRecord::Base
  has_many :reviews
  has_many :cart_line_items
  has_many :orders
  has_many :addresses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :mobile, :gender
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10
end
