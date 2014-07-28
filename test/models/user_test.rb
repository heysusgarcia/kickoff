# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  email                      :string(255)      not null
#  password_digest            :string(255)      not null
#  session_token              :string(255)      not null
#  location                   :string(255)
#  biography                  :text
#  website                    :text
#  created_at                 :datetime
#  updated_at                 :datetime
#  profile_photo_file_name    :string(255)
#  profile_photo_content_type :string(255)
#  profile_photo_file_size    :integer
#  profile_photo_updated_at   :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
