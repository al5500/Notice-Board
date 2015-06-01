class AddColoumnClIdToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :cl_id, :string
  end
end
