class CreatePageMonitors < ActiveRecord::Migration[6.0]
  def change
    create_table :page_monitors, id: :uuid do |t|
      t.string :url
      t.string :name
      t.integer :frequency, default: 600
      t.boolean :enabled, default: true
      t.string :selections, array: true
      t.text :content
      t.text :previous_content
      t.datetime :last_checked_at

      t.timestamps
    end
    add_index :page_monitors, :name
  end
end
