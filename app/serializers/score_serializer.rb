class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :points, :scoreTable_id
end
