class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile

  has_many :favorites
  has_many :products, through: :favorites

  after_create :create_profile

  def create_profile
    Profile.create!(user_id: self.id, name: 'Введите имя пользователя')
  end
end
