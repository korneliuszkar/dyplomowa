class AddCostPerMinuteToServices < ActiveRecord::Migration
  def change
    add_column :services, :cost_per_minute, :float
  end
end
