class OrderSerializer < ActiveModel::Serializer
  attributes :id, :date, :grandTotal, :customer, :address, :items
  belongs_to :customer
  belongs_to :address 

  #Attr methods
  def grandTotal
  	object.grand_total
  end

  def customer
  	OrderCustomerSerializer.new(object.customer)
  end

  def address
  	OrderAddressSerializer.new(object.address)
  end

  def items
  	object.items.map do |item|
  		ItemSerializer.new(item)
  	end
  end
end
