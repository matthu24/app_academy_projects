const HanoiGame = ('./game.js');
const HanoiView = ('./hanoi-view.js');

$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});
