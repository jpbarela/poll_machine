class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :choice
      t.belongs_to :response
      t.timestamps
    end
  end
end
