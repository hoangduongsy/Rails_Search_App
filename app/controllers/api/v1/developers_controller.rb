module Api
  module V1
    class DevelopersController < ApplicationController
      def index
        @developers = SearchDeveloper.new(params).call.preload(:languages, :programming_languages)
        render json: @developers
      end
    end
  end
end