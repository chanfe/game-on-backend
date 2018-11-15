class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password_digest, :first_ending, :second_ending, :secret_place, :secret_login, :max_score_v1, :max_score_v2
  has_many :scores
end
