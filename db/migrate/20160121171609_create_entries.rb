class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
  		t.string   "title"
	    t.string   "slug"
	    t.text     "description"
	    t.integer  "user_id"
	    t.datetime "published_at"
	    t.string   "category"
      	t.timestamps null: false
    end
  end
end
