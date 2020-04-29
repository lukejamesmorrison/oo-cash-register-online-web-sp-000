require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :items, :previous_total, :last_item
  
  @last_item = nil
  @previous_total = 0
  @items = []
  
  def initialize(discount = 0)
    @total = 0
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
    
    if self.discount === 0
      return "There is no discount to apply."
    end
    
    discount = (self.discount.to_f / 100) #In percent
    self.total = self.total * (1 - discount)
    
    "After the discount, the total comes to $#{self.total.to_i}."
  end
  
  def void_last_transaction
    
    if self.items.empty?
      return 0.0
    end

    self.total = self.previous_total
  end
  
end
