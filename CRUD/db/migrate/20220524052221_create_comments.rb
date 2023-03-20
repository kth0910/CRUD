class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
		t.string :nickname
		t.text :content
		t.belongs_to :post 
		t.integer :post_id
		t.timestamps
    end
  end
end
