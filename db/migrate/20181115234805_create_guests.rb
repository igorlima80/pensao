class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests, id: :uuid do |t|
      t.jsonb :social_data
      t.float :latitude
      t.float :longitude
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
