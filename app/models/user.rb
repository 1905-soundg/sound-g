class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  has_many :addresses
  has_many :orders
  has_many :carts
  has_many :favorites
  has_many :reviews,dependent: :destroy

  validates :last_name,presence: true, length:{ in: 1..50 }
  validates :first_name,presence: true, length:{ in: 1..50 }
  validates :last_name_k,presence: true, length:{ in: 1..50 },format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_k,presence: true, length:{ in: 1..50 },format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postalcode,presence: true, length:{is:7},format:{with:/\A[0-9]+\z/ ,message:'は数字で入力してください。'}
  validates :telephone_number,presence: true,length:{ in: 9..20 },format:{with:/\A[0-9]+\z/ ,message:'は数字で入力してください。'}


end
