class CreateDataboxes < ActiveRecord::Migration
  def change
    create_table :databoxes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
