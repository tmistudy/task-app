class User < ApplicationRecord
  validates :title, presence: true
  validates :start, presence: true
  validates :end_day, presence: true
  validate :after_start
  validate :after_end

  def after_start
    return if start.blank?
      errors.add(:start,"は今日以降の日にちを選択してください") if start < Date.current
  end

  def after_end
    return if end_day.blank? || start.blank?
    errors.add(:end_day,"は開始日以降の日にちを選択してしてください") if end_day < start
  end
  
end
