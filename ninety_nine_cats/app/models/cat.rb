# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, :name, :color, :sex, presence: true
  validates :color, inclusion: { in: CAT_COLORS }
  validates :sex, inclusion: { in: %w(M F) }
  
  CAT_COLORS = %w(black brown white orange gray)
  
end
