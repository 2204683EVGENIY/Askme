class Hashtag < ApplicationRecord
  REGEXP = /#[[:word:]-]+/.freeze

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  scope :with_questions, -> { where_exists(:hashtag_questions) }

  validates :text, presence: true
end
