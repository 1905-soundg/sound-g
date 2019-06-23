class OrdersController < ApplicationController
	def new
	 @carts = Cart.where(user_id: current_user.id)
	 @fee = 500
	 @order = Order.new
	 @user = current_user
	 @address = Address.new
	 @addresses = Address.where(user_id: current_user.id)
	end

	def create
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
			 @order.first_name = @order_address.name
			 @order.postalcode = @order_address.postalcode
		end
		# order_detailの作成とcartの削除
		@carts.each do |cart|
			@order_detail = @order.order_details.new
			@order_detail.product_id = cart.product_id
			@order_detail.quantity = cart.quantity
			@order_detail.order_price = view_context.get_subtotal(cart)
			@order_detail.save

			#商品の在庫数を購入分変更する
			product = cart.product
			cart.product.stock_quantity -= @order_detail.quantity.to_i
			product.save

			#cartの削除
			cart.destroy
		end
	 @order.save
	 redirect_to success_user_orders_path()
	end

	def success
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :subtotal_price, :fee, :address, :order_status)
	end

end
