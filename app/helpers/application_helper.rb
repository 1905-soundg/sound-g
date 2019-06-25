module ApplicationHelper


    #product/show商品の在庫数/不採用
    def get_quantity(c)

        total = 0

        c.each do |cart|
            total += cart.quantity.to_i
        end
        return total
    end


    #cart/indexの商品在庫数変更/不採用

    def get_total_quantity(q)

        #カートに追加できる個数
        total_quantity = 0

        #その商品が入っているすべてのカートの合計
        cart_quantity = 0

        subtotal_quantity = 0

        #その商品の在庫数ーその商品が入っているすべてのカートの合計
        stock_total = 0

        carts = Cart.where(product_id: q.product.id)
        carts.each do |ca|
        cart_quantity += ca.quantity
        subtotal_quantity += cart_quantity
        end


        subquantity = subtotal_quantity - q.quantity
        stock_total = q.product.stock_quantity - subquantity
        total_quantity += stock_total
        return total_quantity

    end

    #cart/indexの商品在庫数変更/不採用

    def get_total_quantity(q)

        #カートに追加できる個数
        total_quantity = 0


        #その商品の在庫数ーその商品が入っているカートの中の個数
        stock_total = 0

        stock_total = q.product.stock_quantity - q.quantity
        total_quantity += stock_total
        return total_quantity

    end


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
