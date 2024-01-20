# == Schema Information
#
# Table name: arenas
#
#  id         :bigint           not null, primary key
#  concluded  :boolean
#  name       :string
#  started    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Arena < ApplicationRecord

  has_many :participations
  has_many :tiles

  validates_length_of :name, minimum: 3, maximum: 100

  attribute :started, :boolean, default: false
  attribute :concluded, :boolean, default: false
end
