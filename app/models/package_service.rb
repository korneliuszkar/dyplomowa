# == Schema Information
#
# Table name: package_services
#
#  id         :integer          not null, primary key
#  package_id :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PackageService < ActiveRecord::Base
  validates :service_id, uniqueness: true
  belongs_to :service
  belongs_to :package
end
