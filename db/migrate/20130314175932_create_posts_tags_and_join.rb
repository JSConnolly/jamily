class CreatePostsTagsAndJoin < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id

      t.timestamps
    end

    create_table :tags do |t|
      t.string :content, null: false

      t.timestamps
    end

    create_table :posts_tags do |t|
      t.integer :post_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

  end
end
