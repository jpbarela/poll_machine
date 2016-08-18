class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.belongs_to :user
      t.belongs_to :poll
      t.timestamps
    end
  end
end
