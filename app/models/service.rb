# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  time       :integer
#  price      :float
#

class Service < ActiveRecord::Base
  include ActiveModel::Validations
  validates :name, presence: true
  validates :time, numericality: {:greater_than => 0}, presence: true
  validates :price, presence:true, numericality: {:greater_than => 0} 
  #validates :price, presence: true, numericality: true
end
