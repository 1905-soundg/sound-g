class OrdersController < ApplicationController
	before_action :authenticate_user!
	def new
	 @carts = Cart.where(user_id: current_user.id)
	 @fee = 500
	 @order = Order.new
	 @user = current_user
	 @address = Address.new
	 @addresses = Address.where(user_id: current_user.id)
	end

	def create
		#トランザクション処理
		ActiveRecord::Base.transaction do

	@carts = Cart.where(user_id: current_user.id)
	@user = current_user
	 @order = Order.new(order_params)
	 @order.user_id = current_user.id

		 if @order.address == @user.address

		 	#ユーザー登録時に登録した住所を選択した場合
			 @order.address = @order.user.address
			 @order.last_name = @order.user.last_name
			 @order.first_name = @order.user.first_name
			 @order.postalcode = @order.user.postalcode
		 else
		 	#送付先の住所を選択した場合
			 ship_address = @order.address.match(/\s/).post_match.to_s
			 address_id = @order.address.match(/\s/).pre_match.to_i
			 @order.address = ship_address
			 @order_address = Address.find(address_id)
			 @order.last_name = @order_address.name
			 @order.first_name = ""
			 @order.postalcode = @order_address.postalcode
		end
		    # order_detailの作成とcartの削除
		    @carts.each do |cart|
			@order_detail = @order.order_details.new
			@order_detail.product_id = cart.product_id
			@order_detail.quantity = cart.quantity
			@order_detail.order_price = view_context.get_subtotal(cart)

			#商品の販売状況を判断する
			product = cart.product
			if product.stock_quantity == 0
       			product.sales_status = 1
    		end

    		#商品の在庫数を購入分変更する

			#販売中止の場合
			if  product.sales_status == "販売停止中"
				flash[:alert] = "販売をしていない商品があります。カートを確認してください。"
			    redirect_to user_carts_path(cart.user.id)
			    raise ActiveRecord::Rollback
			elsif
			#カートの中の商品の数が在庫数より多い
			    product.stock_quantity < @order_detail.quantity
			    flash[:alert] = "カートの中の商品の数が在庫数より多いものがあります。カートを確認してください。"
			    redirect_to user_carts_path(cart.user.id)
			    raise ActiveRecord::Rollback
			else
				product.stock_quantity -= @order_detail.quantity.to_i
				product.save!
			 end

			 @order_detail.save!


			#cartの削除
			cart.destroy
		end

	 @order.save!
	 redirect_to success_user_orders_path
	end
rescue ActiveRecord::Rollback
	end

	def update
	 @order = Order.find(params[:id])
	 @order.update!(order_params)
	 redirect_to admins_path
	end

	def number?(str)
	  	Integer(str)
	  	track_number
	  rescue ArgumentError
	  	false
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :subtotal_price, :fee, :address)
	end

	def params_int(order_params)
		oder_params.each do |key,value|
			if integer_string?(value)
				order_params[key] = value.to_i
			end
		end
	end

end
