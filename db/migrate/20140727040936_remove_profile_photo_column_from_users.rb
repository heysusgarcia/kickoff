class RemoveProfilePhotoColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_photo_file_name
    remove_column :users, :profile_photo_content_type
    remove_column :users, :profile_photo_file_size
    remove_column :users, :profile_photo_updated_at
  end
end
