class CreatePosts < ActiveRecord::Migration
  def change
    create_table(:comments) do |t|
      t.column :username, :string
      t.column :body, :text
    end
  end
end
