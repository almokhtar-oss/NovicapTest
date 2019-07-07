class Discount
  attr_accessor :product_code, :type, :params

  TYPES = %w[x_for_y bulk_purchase_price].freeze

  def initialize(options)
    @type = options[:type]
    @product_code = options[:product_code]
    @params = options[:params]
  end

  def x_for_y(count, price)
    count.divmod(params[:x]).reduce(:+) * params[:y] * price     
  end

  def bulk_purchase_price(count, price)
    price = (price - params[:reduce_by]) if count >= params[:qty]
    price * count
  end
end