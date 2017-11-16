@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name#, :image_url
    json.image_url asset_path(poke.image_url)
  end
end
