const Game = require('./game');
const Asteroid = require('./asteroid');

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("canvas");
  canvasEl.width = 500;
  canvasEl.height = 500;
  const ctx = canvasEl.getContext("2d");
  let game = new Game;
  game.draw(ctx);
  // let asteroid = new Asteroid([150,150]);
  // asteroid.draw(ctx);
});
