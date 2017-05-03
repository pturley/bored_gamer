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

class Game < ApplicationRecord
  has_and_belongs_to_many :artists,
      class_name: "Creator",
      join_table: "artists_games"
  has_and_belongs_to_many :designers,
      class_name: "Creator",
      join_table: "designers_games"
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :families
  has_and_belongs_to_many :honors
  has_and_belongs_to_many :mechanics
  has_and_belongs_to_many :publishers
  has_and_belongs_to_many :subdomains
end
