class User < ActiveRecord::Base
  has_secure_password
  has_many :pomodoros,  -> { order("start_time DESC") }
  before_create :generate_auth_token
  validates :email, :presence => true, :uniqueness => true, :format => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :username, :presence => true, :uniqueness => true, :length => {:minimum => 2, :maximum => 20}, :format => /\A[-a-z|A-Z|0-9|-|_]+\z/
  validate :vanity_url
  before_save :parse_username 
  has_attached_file :avatar, 
    :styles => { :profile => "150x150>", :thumb => "60x60>" }, 
    :url => "/assets/avatars/:id/:style/:basename.:extension", 
    :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension",
    :default_url => '/assets/avatars/:style/avatar.jpg'
  
  def self.current(auth_token)
    where(:auth_token => auth_token).first || GuestUser.new
  end
  
  def to_param
    "#{username}"
  end
  
  def to_partial_path
    "users/header"
  end
  
  def latest_pomodoro
    self.pomodoros.last || NoPomodoro.new
  end

  def tags
    pomodoros = self.pomodoros.where("tag != ?", "")
    pomodoros.collect(&:tag).map(&:downcase).flatten.inject(Hash.new(0)){ |hash,element|
      hash[element] +=1
      hash
    }.sort_by{ |k,v| -v}  
  end

  def by_day
    (1.weeks.ago.to_date..Date.today).map do |date|
    {
      label: first_day(date)? date.strftime("%b %d") : date.strftime("%d"),
      count: pomodoros.where("date(start_time) = ?", date).count
    }
    end
  end

  def first_day(date)
    true if date.day == 1 || date == 1.weeks.ago.to_date
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

  def parse_username 
    self.username = self.username.downcase
  end

  private  
  
  def vanity_url
    if FancyUrls.new.initial_path_segments.include?(username)
      errors.add(:username, "is not available")
    end
  end


end
