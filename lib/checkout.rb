require 'json'

class Checkout
  attr_accessor :cart

  def initialize(rules)
    @cart = {}
    @product_map = load_products
    @discount_map = init_discounts(rules)
  end

  def scan(code)
    return "Invalid Product" if product_map[code].nil?
    cart[code] ||= 0
    cart[code] += 1
  end

  def remove(code)
    return "Invalid Product" if product_map[code].nil?
    return "No such item in cart" if cart[code].nil? || cart[code].zero?
    cart[code] -= 1
  end

  def total
    total = 0
    cart.each do |code, count|
      price = product_map[code].price
      discount = discount_map[code]
      total += discount.nil? ? (price * count) : discount.send(discount.type, count, price)
    end
    total
  end

  private

  def load_products
    file = File.open("products.json")
    products = JSON.load(file)
    file.close
    Hash[products.collect { |product| [product["code"], Product.new(product)] }]
  end

  def init_discounts(rules)
    Hash[rules.collect { |discount| [discount[:product_code], Discount.new(discount)] }]
  end

  def discount_map
    @discount_map ||= {}
  end

  def product_map
    @product_map ||= {}
  end
end