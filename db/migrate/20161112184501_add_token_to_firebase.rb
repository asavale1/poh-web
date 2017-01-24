class AddTokenToFirebase < ActiveRecord::Migration
  def change
  	add_column :firebases, :token, :text
  end
end
