class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  #管理者ログイン後機能一覧に遷移
    def after_sign_in_path_for(resource)
       case resource
       when Admin
         admin_path(resource)
       when User
         root_path
       end
    end

    helper_method :current_cart

    def current_cart(product_id)
        if Cart.where(user_id: current_user.id).find_by(product_id: product_id)
          @cart = Cart.where(user_id: current_user.id).find_by(product_id: product_id)
        else
          @cart = Cart.create(:user_id => current_user.id ,:product_id => product_id )
        end
    end


	protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_k, :first_name_k, :postalcode, :address, :telephone_number])
	  end
end
