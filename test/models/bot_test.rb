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
require "test_helper"

class BotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
