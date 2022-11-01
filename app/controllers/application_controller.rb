class ApplicationController < ActionController::Base

    layout :layout_by_resource

    private
    def layout_by_resource
        "authentication" if devise_controller?      
    end
end
