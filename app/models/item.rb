# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  description :string
#  image_link  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  borrower_id :integer
#  category_id :integer
#  owner_id    :integer
#
class Item < ApplicationRecord
  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })
  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id" })
  belongs_to(:borrower, { :required => true, :class_name => "Borrower", :foreign_key => "borrower_id" })

  validates(:category_id, {:presence => true})
  validates(:description, {:presence => true})
  validates(:image_link, {:presence => true})
  validates(:borrower_id, {:presence => true})
  
end
