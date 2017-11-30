class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :avatar
      t.string :thumbnail
      t.text :introduce
      t.timestamps
    end
  end
end
