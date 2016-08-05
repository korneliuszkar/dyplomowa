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

require 'rails_helper'

RSpec.describe Service, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
