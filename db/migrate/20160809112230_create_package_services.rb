class CreatePackageServices < ActiveRecord::Migration
  def change
    create_table :package_services do |t|
      t.integer :package_id
      t.integer :service_id
      t.timestamps null: false
    end
  end
end
