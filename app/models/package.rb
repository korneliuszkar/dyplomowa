# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Package < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :package_services
  has_many :services, through: :package_services
end
