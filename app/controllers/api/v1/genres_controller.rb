class Api::V1::GenresController < ApplicationController
    # before_action :set_user, only: %i[ show update destroy ]

    def index
        @genres = Genre.all
        render json: {status: 'SUCCESS', message: 'Loaded Genres', data:@genres}, status: :ok
    end
end
