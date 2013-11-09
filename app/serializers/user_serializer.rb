class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name
  embed :ids, include: true
  has_many :pomodoros
end
