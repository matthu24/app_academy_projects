import values from 'lodash/values';

//exports all pokemon objects as an array
export const selectAllPokemon = state => (
  values(state.entities.pokemon)
);
