class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :lastName, :firstName, :phone, :email, :addresses
  
  # Attribute methods:
  def lastName
    object.last_name
  end 

  def firstName
  	object.first_name
  end

  def addresses
  	object.addresses.map do |addy|
  		AddressSerializer.new(addy)
  	end
  end

end
