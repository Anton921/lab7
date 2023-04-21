class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :authenticate_user!
    helper_method :current_order
    before_action :set_categories

    def current_order
        Order.in_progress.find_or_create_by(user: current_user)
    end
    
    def set_categories
      @categories = Category.all
    end
end
