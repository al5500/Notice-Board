class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :heading
      t.text :message
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
