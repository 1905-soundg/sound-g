module ApplicationHelper



    #税込の商品価格
    def get_producttax(t)
        tax = 1.08
        producttax = t.price * tax
        return producttax.floor

    end



	 #crat/index・order/new注文小計
     def get_price(c)

    	total = 0
        tax = 1.08

    	c.each do |cart|
    		subtotal = cart.product.price * cart.quantity
    		total += subtotal
    	end
         totaltax = total * tax
    	return totaltax.floor
    end



    #order/new注文総計
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


    #crat/index商品小計
    def get_subtotal(c)

        tax = 1.08

    		subtotal = c.product.price * c.quantity
            subtotaltax = subtotal * tax

    	return subtotaltax.floor
    end

end
