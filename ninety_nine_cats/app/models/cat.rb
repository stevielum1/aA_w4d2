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
require 'action_view'

class Cat < ApplicationRecord
  
  include ActionView::Helpers::DateHelper
  
  CAT_COLORS = %w(black brown white orange gray)
  
  validates :birth_date, :name, :color, :sex, presence: true
  validates :color, inclusion: { in: CAT_COLORS }
  validates :sex, inclusion: { in: %w(M F) }
  
  has_many :rentals,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy
  
  def self.colors
    CAT_COLORS
  end
  
  def age
    time_ago_in_words(birth_date)
  end
  
  def birth_date_s
    birth_date.to_s
  end
end
