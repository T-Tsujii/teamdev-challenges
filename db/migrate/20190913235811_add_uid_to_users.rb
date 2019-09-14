class AddUidToUsers < ActiveRecord::Migration[5.2]
  def change
    # Twitter認証
    add_column :users, :uid,      :string
    add_column :users, :provider, :string
    # ユーザー詳細
    add_column :users, :name,     :string
    add_column :users, :content,  :text
    add_index :users, :name
  end
end
