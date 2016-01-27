class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
  		t.string   "title"
	    t.string   "slug", index: true
	    t.text     "description"
	    t.integer  "admin_id", index: true
	    t.datetime "published_at"
	    t.string   "category"
      	t.timestamps null: false
    end
  end
end
