class AddTimestampsToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :created_at, :datetime, precision: 6, null: false
    add_column :blogs, :updated_at, :datetime, precision: 6, null: false
  end
end
