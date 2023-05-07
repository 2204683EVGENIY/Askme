class User < ApplicationRecord
  DEFAULT_NAVBAR_COLOR = '#370617'.freeze

  has_secure_password

  before_validation :downcase_nickname
  before_validation :downcase_email

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[\w\d]+@[\w\d]+\.[\w]+/ }
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\z/ }
  validates :navbar_color, presence: true

  has_many :questions, dependent: :delete_all

  private

  def downcase_email
    email.downcase
  end

  def downcase_nickname
    nickname.downcase!
  end
end
