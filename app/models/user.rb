class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable

  belongs_to :company

  # Delegate the company name to the associated company
  delegate :name, to: :company, prefix: true

  def name
    email.split("@").first.capitalize
  end
end
