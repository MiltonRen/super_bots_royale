# == Schema Information
#
# Table name: bots
#
#  id               :bigint           not null, primary key
#  attack           :integer
#  catchphrase      :string
#  catchphrase_lose :string
#  defense          :integer
#  description      :string
#  element          :string
#  image_link       :string
#  move_name        :string
#  name             :string
#  speed            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  image_task_id    :string
#
class Bot < ApplicationRecord
  include Gptable

  ELEMENTS = %w[Normal Fire Water Electric Grass Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon Dark Steel Fairy]

  validates_length_of :catchphrase, minimum: 3, maximum: 100
  validates_length_of :description, minimum: 10, maximum: 1000
  validates_length_of :move_name, minimum: 3, maximum: 100
  validates_length_of :name, minimum: 1, maximum: 100

  before_create do
    self.attack = random_stat
    self.defense = random_stat
    self.speed = random_stat
    self.luck = random_stat
    self.unicycle = random_stat
    self.catchphrase_lose = gpt_response("Come up with a losing catchphrase of my new fictional character from its regular catchphrase: #{catchphrase}")
  end

  after_create do
    GenerateImageJob.perform_later(id)
  end

  def check_for_image_generation!
    if image_link.blank?
      if (image = EdenClient.new.getImage(image_task_id))
        update!(image_link: image)
      end
    end
  rescue
  end

  private

  def random_stat
    rand(100..1000)
  end
end
