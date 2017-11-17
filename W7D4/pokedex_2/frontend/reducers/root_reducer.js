import { combineReducers } from 'redux';
import entitiesReducer from './entities_reducer';
import ui from './ui_reducer';

const rootReducer = combineReducers({
  entities: entitiesReducer,
  ui
});
export default rootReducer;
