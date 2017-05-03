# == Schema Information
#
# Table name: creators
#
#  id         :integer          not null, primary key
#  name       :string
#  bgg_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Creator < ApplicationRecord
  has_and_belongs_to_many :drawn_games,
      class_name: "Creator",
      join_table: "artists_games"
  has_and_belongs_to_many :designed_games,
      class_name: "Creator",
      join_table: "designers_games"
end
