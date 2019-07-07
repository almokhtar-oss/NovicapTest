# Novicap Test

## Setup

```
git clone https://github.com/nikhilgoyal22/NovicapTest.git
cd NovicapTest/
irb
```

## Usage

```ruby
> load './main.rb'
> co = Checkout.new(pricing_rules)
> co.scan("VOUCHER")
> co.scan("VOUCHER")
> co.scan("TSHIRT")
> price = co.total
```
## Notes

The checkout process is implemented in Ruby.

- `pricing_rules` are there in `main.rb`.

- The are 3 classes `Checkout`, `Product`, `Discount`. Only 3 products are added at the moment. The products can be scanned/added in any order. Some assumptions made in this approach are.

- Only products available in the catalog should be allowed to be ordered. Ideally, the list of products should be read from DB or from a file. I have added them in a JSON file **products.json** just to make things simple. If any new product needs to be added, one can just add it to the file along with it's price.

- To add a new discount scheme, new type and corresponding method can be added to the `Discount` class.

- `Checkout` class implements the checkout functionality of checkout. It has a cart where product gets added when `scan` is called. I have also added `remove` function to remove the item from the cart.

- While scanning and removing, some validations has been added.

- Code is kept simple and no additional library/gems being used.