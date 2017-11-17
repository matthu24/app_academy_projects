import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';



const itemsReducer = (state = {},action) => {
  Object.freeze(state);

  switch(action.type){
    case RECEIVE_SINGLE_POKEMON: {
      let nextState = action.pokeInfo.items;
      let itemsObject = {};
    //try to get this shape
    //   items: {
    // 3: {
    //   pokemon_id: 2,
    //   name: 'Berry',
    //   price: 5,
    //   happiness: 99,
    //   image_url: '/assets/pokemon_berry.svg',
    // },
    // 4: {
    //   pokemon_id: 2,
    //   name: 'Egg',
    //   price: 5,
    //   happiness: 99,
    //   image_url: '/assets/pokemon_egg.svg',
    // }
      nextState.forEach(el => {
        itemsObject[el.id] = el;
      });
      return merge({},state,itemsObject);
    }

    default:
      return state;
  }
};



export default itemsReducer;
