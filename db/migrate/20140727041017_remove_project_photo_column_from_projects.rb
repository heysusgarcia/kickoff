class RemoveProjectPhotoColumnFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :project_photo_file_name
    remove_column :projects, :project_photo_content_type
    remove_column :projects, :project_photo_file_size
    remove_column :projects, :project_photo_updated_at
  end
end
