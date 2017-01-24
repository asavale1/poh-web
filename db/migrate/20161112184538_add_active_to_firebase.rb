class AddActiveToFirebase < ActiveRecord::Migration
  def change
  	add_column :firebases, :active, :boolean
  end
end
