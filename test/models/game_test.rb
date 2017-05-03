# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  bgg_id        :integer
#  yearpublished :integer
#  minplayers    :integer
#  maxplayers    :integer
#  playingtime   :integer
#  minplaytime   :integer
#  maxplaytime   :integer
#  age           :integer
#  thumbnail     :string
#  image         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
