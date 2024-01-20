# == Schema Information
#
# Table name: arenas
#
#  id         :bigint           not null, primary key
#  concluded  :boolean
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Arena < ApplicationRecord

  validates_length_of :name, minimum: 3, maximum: 100
end
