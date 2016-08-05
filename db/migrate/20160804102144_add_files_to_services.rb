class AddFilesToServices < ActiveRecord::Migration
  def change
    add_column :services, :name, :string
    add_column :services, :time, :integer
    add_column :services, :price, :float
  end
end
