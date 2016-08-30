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

FactoryGirl.define do
  factory :package_service do
    
  end
end
