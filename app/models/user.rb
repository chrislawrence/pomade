class User < ActiveRecord::Base
  has_secure_password
  has_many :pomodoros
  before_create :generate_auth_token
  validates_presence_of :email, :username
  validates_uniqueness_of :email
  validates :username, :presence => true, :uniqueness => true, :length => {:minimum => 2, :maximum => 20}, :format => /\A[-a-z|0-9|-|_]+\z/
  validate :vanity_url
  
  has_attached_file :avatar, :styles => { :profile => "150x150>", :thumb => "60x60>" }, :url => "/assets/avatars/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"


  def add_pomodoro(tag)
   pomodoro = Pomodoro.new_for_user(tag, self.work_time,Time.now)
   self.pomodoros << pomodoro
  end

  private

  def generate_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
  
  def vanity_url
    if FancyUrls.new.initial_path_segments.include?(username)
      errors.add(:username, "is not available")
    end
  end


end
