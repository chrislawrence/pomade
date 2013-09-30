class User < ActiveRecord::Base
  has_secure_password
  has_many :pomodoros,  -> { order("start_time DESC") }
  
  validates :email, :presence => true, :uniqueness => true, :format => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :username, :presence => true, :uniqueness => true, :length => {:minimum => 2, :maximum => 20}, :format => /\A[-a-z|A-Z|0-9|-|_]+\z/
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
  
  before_save :parse_username 
  before_create :generate_auth_token
  
  
  has_attached_file :avatar, 
    styles: { :profile => "150x150>", :thumb => "60x60#" }, 
    url: "/assets/avatars/:id/:style/:basename.:extension", 
    path: ":rails_root/public/assets/avatars/:id/:style/:basename.:extension",
    default_url: '/assets/avatars/:style/avatar.jpg'
  
  def self.current(auth_token)
    where(auth_token: auth_token).first || GuestUser.new
  end
  
  def to_param
    "#{username}"
  end
  
  def to_partial_path
    "users/header"
  end

  def authorised?
    true
  end
 
  def external_link
    self.url || "http://pomade.io/u/#{self.username}"
  end

  def latest_pomodoro
    self.pomodoros.last || NoPomodoro.new
  end

  def tags
    pomodoros = self.pomodoros.pluck(:tag).reject{|t| t == nil}.map(&:downcase)
    tag_counts = Hash.new(0)
    pomodoros.each { |tag| tag_counts[tag] += 1 }
    tag_counts.sort_by{|k,v| v}.reverse
  end

  def generate_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
  
  def new_password(value) 
    self.password = value
    self.password_confirmation = value
    self.auth_token = SecureRandom.urlsafe_base64
    self.save
  end

  def delete_pomodoro(id)
    pomodoro = pomodoros.find_by_id(id) || NoPomodoro.new
    pomodoro.destroy
  end

  private  
  
  def parse_username 
    self.username = self.username.downcase
  end

end
