class AddDateFromDateToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :date_from, :timestamp
    add_column :notices, :date_to, :timestamp
  end
end
