class CreateActiveZoneModels < ActiveRecord::Migration[7.1]
  def change
    create_table :active_zone_zones do |t|
      t.string :name, null: false
      t.column :resolvability, :integer, default: 0, null: false

      t.index :name, unique: true
      t.timestamps
    end

    create_table :active_zone_resources do |t|
      t.string :type
      t.string :name
      t.string :content
      t.integer :ttl
      t.integer :priority
      t.text :provider_metadata
      t.belongs_to :active_zone_zone, foreign_key: {primary_key: :name}

      t.timestamps
    end
  end
end
