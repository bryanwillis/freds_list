# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  price              :string(255)
#  location           :string(255)
#  category_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Post < ActiveRecord::Base

	# Attributes
  # -------------------------------------------------------------------
  attr_accessible :category_id, :description, :location, :price, :title, :photo

  # Validations
  # -------------------------------------------------------------------
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  # Associations
  # -------------------------------------------------------------------
  belongs_to :category

  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
