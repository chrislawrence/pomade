class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :pomodoros
end
