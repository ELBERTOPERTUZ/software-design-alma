class CreateHomeVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :home_videos do |t|
      t.string :title
      t.string :video

      t.timestamps
    end
  end
end
