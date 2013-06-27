# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :string(255)
#  location    :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base

	# Attributes
  # -------------------------------------------------------------------
  attr_accessible :category_id, :description, :location, :price, :title

  # Validations
  # -------------------------------------------------------------------
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  # Associations
  # -------------------------------------------------------------------
  belongs_to :category
end
