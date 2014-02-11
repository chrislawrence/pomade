class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :work_time, :break_time 
  embed :ids, include: true
  has_many :pomodoros
end
