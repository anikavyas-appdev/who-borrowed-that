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
end
