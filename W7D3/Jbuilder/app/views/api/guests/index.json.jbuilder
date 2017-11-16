# json.array! @guests, :name, :age, :favorite_color

# @guests.each do |guest|
#   json.set! guest.id do
#     json.partial! 'guest', guest: guest
#   end
# end

json.array! @guests do |guest|
  next if guest.age < 40 || guest.age > 50
  json.extract! guest, :name, :age, :favorite_color
end
