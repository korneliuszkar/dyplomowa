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

require 'rails_helper'

RSpec.describe PackageService, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
