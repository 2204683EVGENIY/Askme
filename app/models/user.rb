class User < ApplicationRecord
  include Gravtastic

  DEFAULT_NAVBAR_COLOR = '#370617'.freeze
  VALID_NAVBAR_COLOR = /\A#\h{3}{1,2}\z/.freeze
  VALID_EMAIL = /\A\w+@\w+\.\w+\z/.freeze

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname
  before_validation :downcase_email

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL }
  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: /\A\w+\z/ }
  validates :navbar_color, format: { with: VALID_NAVBAR_COLOR }, presence: true

  gravtastic(secure: true, filetype: :png, size: 100, default: 'wavatar')

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end

  def downcase_nickname
    nickname.downcase!
  end
end
