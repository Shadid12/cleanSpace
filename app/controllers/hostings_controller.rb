class HostingsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit] 
    def index
        @hostings = Hosting.all
    end
    
    def new 
        @hosting = Hosting.new
    end
    
    def show
        @hosting = Hosting.find(params[:id])
    end
    
    def create
        @hosting = current_user.hostings.build(hosting_params)
        if @hosting.save
            flash[:success] = "Hosting created!"
            redirect_to root_url
        else
            render '/'
        end
    end
    
    
    private
    
    def hosting_params
        params.require(:hosting).permit(:title, :description)
    end
    
end
