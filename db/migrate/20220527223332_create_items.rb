class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :category_id
      t.string :image_link
      t.integer :owner_id
      t.integer :borrower_id

      t.timestamps
    end
  end
end
