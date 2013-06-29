class User < ActiveRecord::Base
  has_secure_password
  has_many :pomodoros,  -> { order("start_time DESC") }
  before_create :generate_auth_token
  validates :email, :presence => true, :uniqueness => true, :format => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :username, :presence => true, :uniqueness => true, :length => {:minimum => 2, :maximum => 20}, :format => /\A[-a-z|0-9|-|_]+\z/
  validate :vanity_url
  
  has_attached_file :avatar, :styles => { :profile => "150x150>", :thumb => "60x60>" }, :url => "/assets/avatars/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"


  def add_pomodoro(tag)
   pomodoro = Pomodoro.new_for_user(self.work_time,Time.now,tag)
   self.pomodoros << pomodoro
  end

  def self.current(auth_token)
    where(:auth_token => auth_token).first || GuestUser.new
  end
  
  def header
    "<div class='control_wrapper'><div class='controls'><div class='avatar_small'><a href='/#{username}'><img src='#{avatar(:thumb)}' /></a></div></div><div class='logout ss-icon'><a data-method='delete' href='/logout' rel='nofollow'>logout</a> <a href='/settings'>settings</a></div></div>"
  end

  def tags
    pomodoros.collect(&:tag).flatten.inject(Hash.new(0)){ |hash,element|
      hash[element] +=1
      hash
    }.sort_by{ |k,v| -v}  
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
