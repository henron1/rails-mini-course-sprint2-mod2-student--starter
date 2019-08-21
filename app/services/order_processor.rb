class OrderProcessor

    attr_reader :order, :products
    def initialize(order)
        @order = order
        @products =Product.find(OrderProduct.where(order_id: @order.id).pluck(:product_id))
    end

    def ship
        if products_available?
            products.each {|p| p.reduce_inventory}
            order.ship
        else
            false
        end
    end

    private

    def products_available?
        products.count == products.select {|p| p.available?}.count
    end


end
