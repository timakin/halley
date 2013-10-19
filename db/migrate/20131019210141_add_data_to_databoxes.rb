class AddDataToDataboxes < ActiveRecord::Migration
  def change
    add_column :databoxes, :data, :string
  end
end
