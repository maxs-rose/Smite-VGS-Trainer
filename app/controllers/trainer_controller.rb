class TrainerController < ApplicationController
    before_action :selectNextChallenge
    before_action :force_json, only: :search

    def index
        @options = []
    end

    def search
        userInput = input_params.downcase
        puts userInput
        if Element.where("combo like ?", "#{userInput}%").length == 1
            @options = Element.where(combo: userInput).select(:combo, :value)
        else
            @options = Element.where("length(combo) == #{userInput.length + 1}").where("combo like ?", "#{userInput}%").select(:combo, :value)
        end
    end

    private
    def selectNextChallenge
        @challenge ||= getChallenge
    end

    def getChallenge
        return Element.where(final: true).sample
    end

    def input_params
        params.require(:data)
    end

    def force_json
        request.format = :json
    end
end
