class Product
  attr_accessor :name, :code, :price

  def initialize(options)
    @name = options["name"]
    @code = options["code"]
    @price = options["price"]
  end
end
