class AddContentTypeToDataboxes < ActiveRecord::Migration
  def change
    add_column :databoxes, :content_type, :string
  end
end
