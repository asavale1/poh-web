class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :yes_count
      t.integer :no_count

      t.timestamps null: false
    end
  end
end
