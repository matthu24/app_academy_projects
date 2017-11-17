import React from 'react';
import {Link} from 'react-router-dom';

//props passed in need to match names
const PokemonIndexItem = ({pokemon}) =>  (
  <li key={pokemon.id}>
    <Link to={`/pokemon/${pokemon.id}`}>  {pokemon.name}</Link>

    <img src={pokemon.image_url} height="42" width="42"></img>
  </li>
);

export default PokemonIndexItem;
