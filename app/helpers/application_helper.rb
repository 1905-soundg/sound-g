module ApplicationHelper


    #product/show商品の在庫数
    def get_quantity(c)

        total = 0

        c.each do |cart|
            total += cart.quantity.to_i
        end
        return total
    end


    #cart/indexの商品在庫数変更

    def get_total_quantity(q)

        total_quantity = 0

        subtotal_quantity = 0

        total_quantity = 0

        carts = Cart.where(product_id: q.product.id)
        carts.each do |quantity|
        total_quantity += quantity.quantity.to_i
        subtotal_quantity += total_quantity
        end


        subquantity = subtotal_quantity - q.quantity
        stock_total = q.product.stock_quantity - subquantity
        total_quantity += stock_total
        return total_quantity

    end




	 #crat/index総計
     def get_price(c)

    	total = 0

    	c.each do |cart|
    		subtotal = cart.product.price * cart.quantity
    		total += subtotal
    	end
    	return total
    end

    def get_totalprice(c)

    	total = 0
    	fee = 500
    	tax = 1.08

    	c.each do |cart|
    		subtotal = cart.product.price * cart.quantity
    		total += subtotal
    	end
    	total_tax = (total + fee ) * tax
    	return total_tax.floor
    end


    def get_subtotal(c)

    	total = 0

    		subtotal = c.product.price * c.quantity
    		total += subtotal

    	return total
    end

end
