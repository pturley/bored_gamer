# == Schema Information
#
# Table name: honors
#
#  id         :integer          not null, primary key
#  name       :string
#  bgg_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Honor < ApplicationRecord
  has_and_belongs_to_many :games
end
