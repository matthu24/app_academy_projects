// const middleware = (action) => {
//   if (typeof action === "function") {
//     return action(dispatch, getState);
//   } else {
//     return next(action);
//   }
// };

const middleware = store => next => action => {
  if (typeof action === "function") {
    return action(store.dispatch, store.getState);
  }
  return next(action);
};



export default middleware;
