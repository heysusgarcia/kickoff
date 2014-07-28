class AddAttachmentProfilePhotoToUsers2 < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profile_photo
    end
  end

  def self.down
    remove_attachment :users, :profile_photo
  end
end
