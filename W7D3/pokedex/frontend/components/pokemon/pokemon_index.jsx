import React, { Component } from 'react';


class PokemonIndex extends Component {
  componentWillMount(){
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;

    return(
      <section className="pokedex">
        <ul>
          {pokemon.map((poke,i) => {
            return <li key = {i}>{poke.name}
              <img src={poke.image_url} height="42" width="42"></img>
            </li>;
            })}
        </ul>
      </section>
    );
  }
}

export default PokemonIndex;
