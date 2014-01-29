class User < ActiveRecord::Base
  has_many :pomodoros
  has_secure_password
  validates :username, presence: true
  has_attached_file :avatar, 
    styles: { :profile => "150x150>", :thumb => "60x60#" }, 
    url: "/assets/avatars/:id/:style/:basename.:extension", 
    path: ":rails_root/public/assets/avatars/:id/:style/:basename.:extension",
    default_url: '/assets/avatars/:style/avatar.jpg'
  

  preference :work_time, :integer, :default => 25
  
  private

  def generate_token
    self.token = SecureRandom.hex
  end
end
