class UserSerializer < ActiveModel::Serializer
  attributes :id, :work_time, :break_time, :long_break_time, :alert
end
