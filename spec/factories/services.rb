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

FactoryGirl.define do
  factory :service do
    
  end
end
