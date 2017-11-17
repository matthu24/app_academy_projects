import React, { Component } from 'react';
// import PokemonIndexItem from './pokemon_index_item';

class PokemonDetail extends Component {
  componentDidMount(){
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps){
    if(this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    const { pokemon, items } = this.props;
    //i is an object
    //items is an array of objects
    let i = items[0];
    if (!pokemon) return null;

    return(
      <section className="pokedetail">
        <ul>
          <li className="pokeImage"><img src={pokemon.image_url} height="42" width="42"></img></li>
          <li>Name: {pokemon.name}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li className = "items">
            {
               items.map(item => {
                 return item.name;
               })
            }
          </li>



        </ul>

      </section>
    );
  }
}

export default PokemonDetail;
