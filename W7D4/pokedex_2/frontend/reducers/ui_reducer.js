import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const uiReducer = (state = {},action) => {
  Object.freeze(state);

  switch(action.type){
    case RECEIVE_SINGLE_POKEMON: {
      let nextState = { pokeDisplay: action.pokeInfo.pokemon.id };
      return merge({},state,nextState);
    }
    default:
      return state;
  }
};



export default uiReducer;
