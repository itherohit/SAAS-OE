class Store
	def initialize(aitem="Nothing",aprice=0)
		@item=aitem
		@price=aprice
	end
	def set_price(item,price)
		@item=item
		@price=price
	end
	def price_chng(price)
		@price=price
	end
	def to_s
	"The item is #{@item} with a price of #{@price} dollar."
	end
end
obj=Store.new("Books",25)
puts obj
obj.price_chng(32.5)
puts "After price change ",obj




