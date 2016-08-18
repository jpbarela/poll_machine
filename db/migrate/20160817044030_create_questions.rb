class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.belongs_to :poll
      t.timestamps
    end
  end
end
