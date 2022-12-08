class User < ApplicationRecord
  VALID_ROLES = %w[admin cheif client logistic\ manager sales\ manager supply\ manager warehouse\ worker]
  validates :role, inclusion: { in: VALID_ROLES }
  after_commit :check_users, on: %i[create update destroy]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_one :employee

  def check_users
      User.where(role: 'admin').count == 1 ? VALID_ROLES.delete('admin') : VALID_ROLES
      User.where(role: 'cheif').count == 1 ? VALID_ROLES.delete('cheif') : VALID_ROLES
      User.where(role: 'logistic manager').count == 2 ? VALID_ROLES.delete('logistic manager') : VALID_ROLES
      User.where(role: 'sales manager').count == 3 ? VALID_ROLES.delete('sales manager') : VALID_ROLES
      User.where(role: 'supply manager').count == 2 ? VALID_ROLES.delete('supply manager') : VALID_ROLES
      User.where(role: 'warehouse worker').count == 5 ? VALID_ROLES.delete('warehouse worker') : VALID_ROLES
  end
end