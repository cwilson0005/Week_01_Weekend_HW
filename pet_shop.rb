def pet_shop_name(name)
  return name[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  return shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount)
  shop[:admin][:pets_sold] += amount
end

def stock_count(shop)
  shop_counter = 0
  for pet in shop[:pets]

    shop_counter += 1
  end

  return shop_counter

end

def pets_by_breed(shops, breed)

  arr_breeds = []

  for pet in shops[:pets]

    if pet[:breed] == breed
      arr_breeds.push(pet)
    end

  end

  return arr_breeds

end

def find_pet_by_name(shops, name)

  for pet in shops[:pets]
    if pet[:name] == name
      return pet
    end
  end

  return nil

end

# def remove_pet_by_name(shops, name)
#
#   for pet in shops[:pets]
#     if pet[:name] == name
#       pet.delete(name)
#     end
#   end
#
# end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)

  pet_counter = 0

  for pet in customer[:pets]
    pet_counter += 1
  end

  return pet_counter

end

def add_pet_to_stock(shops, pets)
  shops[:pets] << pets
end

def add_pet_to_customer(customer, pets)
  customer[:pets] << pets
end

def customer_can_afford_pet(customer, new_pet)
  customer[:cash] > new_pet[:price] ? true : false
end

def sell_pet_to_customer(shops, pet, customer)


  add_pet_to_customer(customer, pet)
  increase_pets_sold(shops, shops[:admin][:pets_sold])
  add_or_remove_cash(shops, customer_cash(customer))
  remove_customer_cash(customer, customer_cash(customer))
  
  # customer_pet_count(customer)
  # pets_sold(shops)
  # customer_cash(customer)
  # total_cash(shops)
end
