class VoteSerializer < ActiveModel::Serializer
    attributes :vote_value
    belongs_to :review
    belongs_to :user
end