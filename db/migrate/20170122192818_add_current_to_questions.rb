class AddCurrentToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :current, :boolean
  end
end
