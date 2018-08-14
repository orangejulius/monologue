class AddIndexToTagName < ActiveRecord::Migration[5.1]
  def change
    add_index :monologue_tags, :name
  end
end
