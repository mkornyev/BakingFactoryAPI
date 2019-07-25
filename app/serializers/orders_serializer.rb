class OrdersSerializer < ActiveModel::Serializer
  attributes :id, :date, :grandTotal, :customerName, :itemCount

  #Attr methods
  def grandTotal
  	object.grand_total
  end

  def customerName
  	object.customer.name
  end

  def itemCount
  	object.items.size
  end
end
