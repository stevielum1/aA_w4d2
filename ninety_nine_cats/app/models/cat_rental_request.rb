# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :start_date, :end_date, :status, presence: true
  validate :does_not_overlap_approved_request
  
  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat
  
  def overlapping_requests
    CatRentalRequest.where(start_date: self.start_date..self.end_date)
    .where.not(id: self.id)
    .where(cat_id: self.cat_id)
  end
  
  def overlapping_approved_requests
    overlapping_requests.where(status:'APPROVED')
  end

  private
  
  def does_not_overlap_approved_request
    overlapping_approved_requests.exists?
  end
  
end
