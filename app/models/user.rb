class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  has_many :pomodoros
  validates :username, presence: true
  has_attached_file :avatar, 
    styles: { :profile => "150x150>", :thumb => "60x60#" }, 
    url: "/assets/avatars/:id/:style/:basename.:extension", 
    path: ":rails_root/public/assets/avatars/:id/:style/:basename.:extension",
    default_url: '/assets/avatars/:style/avatar.jpg'
  attr_accessor :avatar_file_name

  preference :work_time, :integer, :default => 25
  
  private

  def generate_token
    self.token = SecureRandom.hex
  end
end
