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

    def get_total_quantity(c)

        total = 0

        subtotal = 0

        totalquantity = 0

        @carts = Cart.where(product_id: c.product.id)

        @carts.each do |cart|

        totalquantity += cart.quantity.to_i

        subtotal += totalquantity

        end


        subquantity = subtotal - c.quantity

        stock_total = c.product.stock_quantity - subquantity

        total += stock_total

        return total
    end




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
