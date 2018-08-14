class RenamePostTagsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :posts_tags, :monologue_posts_tags
  end
end
