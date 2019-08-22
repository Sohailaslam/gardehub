class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :skip_password_validation

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email

  enum user_type: ["employer", "employee", "instructor"]

  has_attached_file :profile_pic, styles: { medium: "300x300", small: "150x150" },default_url: "/avatar.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  def make_admin
    self.update!(admin: true)
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

end
