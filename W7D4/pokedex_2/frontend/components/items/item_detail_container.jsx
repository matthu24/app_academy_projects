import { connect } from 'react-redux';

import ItemDetail from './item_detail';

// import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { selectPokeItems } from '../../reducers/selectors';


const mapStateToProps = state => {
  item: selectPokeItems(state,parseInt(match.params.itemId))
};

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

const PokemonIndexContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

export default PokemonIndexContainer;
