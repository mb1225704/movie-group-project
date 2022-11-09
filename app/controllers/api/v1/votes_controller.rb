class Api::V1::VotesController < ApiController
    def create 
        binding.pry
        votes = Vote.new()
    end
end