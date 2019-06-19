class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  has_many :addresses
  has_many :orders
  has_many :carts
  has_many :favorites, dependent: :destroy
  has_many :reviews,dependent: :destroy

end
