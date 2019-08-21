class Order < ApplicationRecord
    attr_reader :products, :order
    def products
        product_ids = OrderProduct.where(order_id: id).pluck(:product_id)
        Product.find(product_ids)
    end

    def shippable?
        puts "this is working at least"
        !(OrderProduct.where(order_id: id).blank? || status == 'shipped')
    end

    def ship
        if shippable?
            if update(status: "shipped")
                puts "testttttt00000000000000000000000"
                true
            else
                puts "not updated alskdfjas;dlkfj;asldkjfa;sdfjk"
                false
            end
        else
            puts "not shippableeeeeeeeeee"
            false
        end
    end
end
