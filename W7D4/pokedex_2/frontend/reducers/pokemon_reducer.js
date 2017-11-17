import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';


const pokemonReducer = (state = {},action) => {
  Object.freeze(state);

  switch(action.type){
    case RECEIVE_ALL_POKEMON: {
      let newState = action.pokemon;
      return merge({},state,newState);
    }
    case RECEIVE_SINGLE_POKEMON: {
      let nextPokemon = action.pokeInfo.pokemon;
      //add new key value to nextState object whose value is an array of the item id's associated with that specific pokemon
      nextPokemon.item_ids = action.pokeInfo.items.map((item) => item.id );

      //{123: {id: 123, name: "dragonite",etc}}
      return merge({},state,{[nextPokemon.id]: nextPokemon});
    }
    default:
      return state;
  }
};



export default pokemonReducer;
