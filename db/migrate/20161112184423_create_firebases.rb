class CreateFirebases < ActiveRecord::Migration
  def change
    create_table :firebases do |t|

      t.timestamps null: false
    end
  end
end
