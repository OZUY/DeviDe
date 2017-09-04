class User < ActiveRecord::Base

  #accessor
  attr_accessor :univ_key

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable,
         authentication_keys: [:email, :univ_key]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  #association
  belongs_to :univ
  has_many :messages, ->{ order("created_at DESC")}

  #validation
  before_validation :univ_key_to_id, if: :has_univ_key?

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    univ_key = conditions.delete(:univ_key)
    univ_id = Univ.where(key: univ_key).first
    email = conditions.delete(:email)

    # devise認証を、複数項目に対応させる
    if univ_id && email
      where(conditions).where(["univ_id = :univ_id AND email = :email",
        { univ_id: univ_id, email: email }]).first
    elsif conditions.has_key?(:confirmation_token)
      where(conditions).first
    else
      false
    end
  end

  def name
    "#{family_name} #{first_name}"
  end
  def name_kana
    "#{family_name_kana} #{first_name_kana}"
  end

  def full_profile?
    avatar? && family_name? && first_name? && family_name_kana? && first_name_kana?
  end


  private
  def has_univ_key?
    univ_key.present?
  end

  def univ_key_to_id
    univ = Univ.where(key: univ_key).first_or_create
    self.univ_id = univ.id
  end
end
