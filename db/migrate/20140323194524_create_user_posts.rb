class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :permission

      t.timestamps
    end
  end
end
