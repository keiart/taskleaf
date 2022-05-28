class Task < ApplicationRecord
  has_one_attached :image
  before_validation :set_nameless_name
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  validate :validate_name_not_including_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  # 指定したカラムのみ検索に使用する
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  # 空の配列でオーバーライド
  def self.ransackable_associations(auth_object = nil)
    []
  end

  private

  def set_nameless_name
    self.name = "無題" if name.blank?
  end

  #自作バリデーション削除してよい
  def validate_name_not_including_comma
    errors.add(:name, "にカンマを含めることはできません") if name&.include?(",")
  end
end
