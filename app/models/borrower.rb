# == Schema Information
#
# Table name: borrowers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Borrower < ApplicationRecord
  has_many(:items, { :class_name => "Item", :foreign_key => "borrower_id", :dependent => :destroy })
end
