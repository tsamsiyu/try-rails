class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :authentication_token

      t.timestamps

      t.index :email, unique: true
      t.index :authentication_token, unique: true
    end
  end
end
