class CreateFacebookers < ActiveRecord::Migration
  def change
    create_table :facebookers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :business_name
      t.string :business_type
      t.string :business_address
      t.string :location
      t.string :gender
      t.string :image
      t.string :role_type

      t.timestamps
    end
  end
end