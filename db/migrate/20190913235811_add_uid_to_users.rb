class AddUidToUsers < ActiveRecord::Migration[5.2]
  def change
    # Twitter認証
    add_column :users, :uid,      :string
    add_column :users, :provider, :string
    add_column :users, :image_url, :string
    # ユーザー詳細
    add_column :users, :name,     :string
    add_column :users, :content,  :text
    add_index :users, :name
    add_index :users, [:provider, :uid], unique: true
  end
end
