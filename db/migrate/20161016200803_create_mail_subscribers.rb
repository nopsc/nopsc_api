class CreateMailSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_subscribers do |t|
      t.string :email

      t.timestamps
    end
    add_index :mail_subscribers, :email, unique: true
  end
end
