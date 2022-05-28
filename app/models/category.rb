# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many(:items, { :class_name => "Item", :foreign_key => "category_id", :dependent => :destroy })
end
