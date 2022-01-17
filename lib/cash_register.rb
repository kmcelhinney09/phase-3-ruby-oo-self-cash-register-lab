require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction.clear
        total_charge = price * quantity
        self.total = self.total + total_charge
        quantity.times {self.items.push(title)}
        self.last_transaction.push(title,price,quantity)
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else
            self.total = self.total - self.total * (self.discount / 100.0)
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        quantity = self.last_transaction[2]
        total_charge = self.last_transaction[1] * quantity
        quantity.times{self.items.pop}
        self.total = self.total - total_charge
    end
end

# binding.pry
# 0
