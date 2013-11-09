class PomodoroSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :tag
end
