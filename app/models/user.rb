# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :string           default("customer"), not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login

  module Roles
    ADMIN = "admin"
    CUSTOMER = "customer"
  end
  DEFAULT_ROLE = Roles::CUSTOMER
  ROLES = Roles.constants.map {|c| Roles.const_get(c) }

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, presence: true, inclusion: { in: ROLES }
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true, uniqueness: true
  before_validation :set_defaults, on: [:create]

  scope :admins, -> { where(role:Roles::ADMIN)}

  def admin?
    self.role == Roles::ADMIN
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  private

    def set_defaults
      self.role = DEFAULT_ROLE
    end
end
