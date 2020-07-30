class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.datetime :start_time
      
      t.references :user, foreign_key: true

      t.references :tweet, foreign_key: true
      t.string :tweet_title
      t.text :tweet_text
      t.string :tweet_image

      t.timestamps
    end
  end
end
