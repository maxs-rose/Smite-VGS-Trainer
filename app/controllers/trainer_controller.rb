class TrainerController < ApplicationController
    before_action :force_json, only: [:search, :challenge, :vgs]

    def index
    end

    def vgs
        @all = indexJsonRequest()
    end

    def challenge
        @challenge = getChallenge()
    end

    def search
        userInput = input_params.downcase
        @options = doSearch(userInput)
    end

    private
    def indexJsonRequest
        Element.select(:combo, :final, :value)
    end

    def doSearch(input)
        if Element.where("combo like ?", "#{input}%").length == 1
            Element.where(combo: input).select(:combo, :value)
        else
            Element.where("length(combo) = ?", input.to_s.length + 1).where("combo like ?", "#{input}%").select(:combo, :value)
        end
    end

    def getChallenge
        Element.where(final: true).sample
    end

    def input_params
        params.require(:data)
    end

    def force_json
        request.format = :json
    end
end
