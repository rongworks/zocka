class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
