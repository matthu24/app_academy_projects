json.pokemon @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
json.pokemon do
   json.image_url asset_path(@pokemon.image_url)
end


json.items @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
