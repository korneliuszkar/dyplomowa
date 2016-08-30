# == Schema Information
#
# Table name: services
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#  time            :integer
#  price           :float
#  cost_per_minute :float
#

class Service < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :time, numericality: {:greater_than => 0}, presence: true
  validates :price, presence:true, numericality: {:greater_than => 0}

  before_validation :set_defaults, on: [:update, :create]
  before_save :calculate_cost
  before_update :actual_service

  #private
  def set_defaults
    self.name = "Without name" if name.blank?
  end

  def calculate_cost
    self.cost_per_minute = price / time
  end
  def actual_service
    # UserMailer.service_update(4).deliver_now
  end
end
