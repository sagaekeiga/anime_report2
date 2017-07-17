class LocatesController < ApplicationController
    
    def index
      @locates = Locate.all
    end
    
    def new
        @locate = Locate.new
    end
    
    def create
     @locate = Locate.new(locate_params)
     if @locate.save
       redirect_to root_path
     else
       render 'locates/new'
     end
    end
    
    def edit
      @locate = Locate.find(params[:id])
    end
    
    def destroy
      @locate = Locate.find(params[:id])
        if @locate.delete
         flash[:success] = "deleted"
        end
        redirect_to root_path
    end
    
    def show
      @locate = Locate.find(params[:id])
    end
    
    def update
        @locate = Locate.find(params[:id])
        @locate.update(locate_params)
        redirect_to root_path
    end
    
      private
      
        def locate_params
          params.require(:locate).permit(:name, :latitude, :longitude)
        end
end
