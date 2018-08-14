class CreateMonologueTags < ActiveRecord::Migration[5.1]
  def change
    create_table :monologue_tags do |t|
      t.string :name

    end
  end
end
