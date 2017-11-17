import values from 'lodash/values';

//exports all pokemon objects as an array
export const selectAllPokemon = state => (
  values(state.entities.pokemon)
);

// map the id to return that object for the display pokemon or return empty array
export const selectPokeItems = (state, pokemon) => {
  //return [{id:3, name: "efe",etc},{another item}]
  return pokemon ? pokemon.item_ids.map(id => state.entities.items[id]) : [];
};
