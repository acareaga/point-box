class AddPaperclipFieldsToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :image_file_name, :string
    add_column :rewards, :image_content_type, :string
    add_column :rewards, :image_file_size, :integer
    add_column :rewards, :image_updated_at, :datetime
  end
end
