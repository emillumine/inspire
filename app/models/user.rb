class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :recommendations
  has_many :thumbs_ups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :username, presence: {
		message: "Erreur ! Le nom doit être renseigné."
	}

	validates :username, uniqueness: {
		message: "Erreur ! Ce nom est déjà pris."
	}

end
