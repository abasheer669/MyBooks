class Api::V1::UsersController < ApplicationController
        before_action :set_user, only: %i[ show update destroy ]

        def index
            
                @users = User.all
                #render json: {status: 'SUCCESS', message: 'Loaded users', data:@users}, status: :ok
                render json: @users, root: "users", each_serializer: Api::V1::UserSerializer
            

        end
    
        def show
            render json: @user, serializer: Api::V1::UserSerializer
            #render json: {status: 'SUCCESS', message: 'Loaded user', data:@user}, status: :ok
        end
    
        def create
            
            @user = User.new(user_params)
            if @user.save 
                render json: {status: 'SUCCESS'}
            else
                render json: {status: 'ERROR'}
            end
        end
    
        def destroy
            @user.destroy
            render json: {status: 'SUCCESS'}
        end
    
        def update
            if @user.update(user_params)
                render json: {status: 'SUCCESS'}
            else
                render json: {status: 'ERROR'}
            end
        end
    
        private
        
        def user_params
            params.require(:user).permit(:username, :email, :password)
         end

        def set_user
            @user = User.find(params[:id])
        end
 
end
