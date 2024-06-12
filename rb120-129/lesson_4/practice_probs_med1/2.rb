class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

amazon_purchase = InvoiceEntry.new("hair dryer", 2) # => <InvoiceEntry: encoding
# of object ID, @quantity=2, @product_name="hair dryer">
p amazon_purchase.update_quantity(5) # => 5
p amazon_purchase.quantity # => 2

# Currently, the code in `update_quantity` will initialize a local variable
# `quantity` to `updated_count`. Instead, we'd like to re-assign the `@quantity`
# instance variable to the `updated_count`. Therefore, we need to prepend
# `quantity` with `@`.

# Solution 1
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

amazon_purchase = InvoiceEntry.new("hair dryer", 2) # => <InvoiceEntry: encoding
# of object ID, @quantity=2, @product_name="hair dryer">
p amazon_purchase.update_quantity(5) # => 5
p amazon_purchase.quantity # => 5

# Solution 2
class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

amazon_purchase = InvoiceEntry.new("hair dryer", 2) # => <InvoiceEntry: encoding
# of object ID, @quantity=2, @product_name="hair dryer">
p amazon_purchase.update_quantity(5) # => 5
p amazon_purchase.quantity # => 5