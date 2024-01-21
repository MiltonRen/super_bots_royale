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
  include ActionView::RecordIdentifier

  has_many :participations
  has_many :tiles
  has_many :battle_logs

  validates_length_of :name, minimum: 3, maximum: 100

  attribute :started, :boolean, default: false
  attribute :concluded, :boolean, default: false

  def broadcast_update
    broadcast_replace_to(
      "#{dom_id(self)}_messages_stream",
      partial: "arenas/battle_progress",
      locals: {arena: self},
      target: "battle_progress"
    )
  end
end
