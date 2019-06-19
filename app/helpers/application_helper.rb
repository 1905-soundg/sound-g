module ApplicationHelper
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
