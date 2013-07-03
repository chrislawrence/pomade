class User < ActiveRecord::Base
  has_secure_password
  has_many :pomodoros,  -> { order("start_time DESC") }
  before_create :generate_auth_token
  validates :email, :presence => true, :uniqueness => true, :format => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :username, :presence => true, :uniqueness => true, :length => {:minimum => 2, :maximum => 20}, :format => /\A[-a-z|0-9|-|_]+\z/
  validate :vanity_url
 
  has_attached_file :avatar, 
    :styles => { :profile => "150x150>", :thumb => "60x60>" }, 
    :url => "/assets/avatars/:id/:style/:basename.:extension", 
    :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension",
    :default_url => '/assets/avatars/:style/avatar.jpg'

  def add_pomodoro(tag)
   pomodoro = Pomodoro.new_for_user(self.work_time,Time.now,tag)
   self.pomodoros << pomodoro
  end

  def self.current(auth_token)
    where(:auth_token => auth_token).first || GuestUser.new
  end
  
  def to_param
    "#{username}"
  end
  
  def to_partial_path
    "users/header"
  end

  def tags
    pomodoros.collect(&:tag).flatten.inject(Hash.new(0)){ |hash,element|
      hash[element] +=1
      hash
    }.sort_by{ |k,v| -v}  
  end

  def by_day
    (2.weeks.ago.to_date..Date.today).map do |date|
    {
      day: date,
      count: pomodoros.where("date(start_time) = ?", date).count
    }
    end
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
  
  def vanity_url
    if FancyUrls.new.initial_path_segments.include?(username)
      errors.add(:username, "is not available")
    end
  end


end
