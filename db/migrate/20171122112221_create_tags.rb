class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.text :content
      t.string :deleted_at

      t.timestamps
    end
  end
end
