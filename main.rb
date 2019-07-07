require_relative 'lib/product.rb'
require_relative 'lib/discount.rb'
require_relative 'lib/checkout.rb'

def pricing_rules
  [
    {
      product_code: 'VOUCHER',
      type: 'x_for_y',
      params: { x: 2, y: 1}
    },
    {
      product_code: 'TSHIRT',
      type: 'bulk_purchase_price',
      params: { qty: 3, reduce_by: 1 }
    }
  ]
end
