class CashRegister
  
  attr_accessor :total, :discount, :items, :previous_total, :last_item
  
  @last_item = nil
  @previous_total = 0
  
  def initialize(discount = 0)
    @total = 0
    @items = []
    @discount = discount
  end
  
  def add_item(title, price, quantity = 1)
  
    item = {
      title: title,
      price: price,
      quantity: quantity
    }
    
    self.previous_total = @total
    self.total += (item[:price] * item[:quantity])
    quantity.times { @items << item[:title] }
    self.last_item = item
  end
  
  def apply_discount
    
    return "There is no discount to apply." if self.discount === 0
    
    discount = (self.discount.to_f / 100) #In percent
    self.total = self.total * (1 - discount)
    
    "After the discount, the total comes to $#{self.total.to_i}."
  end
  
  def void_last_transaction
    
    return 0.0 if self.items.empty?
    
    self.total = self.previous_total
  end
  
end
