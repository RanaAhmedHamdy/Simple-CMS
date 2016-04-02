class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer "subject_id"
      t.column "name", :string
      t.column "permalink", :integer
      t.column "position", :integer
      t.column "visible", :boolean, :default => false

      t.timestamps null: false
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
  def down
  	drop_table :pages
  end
end
