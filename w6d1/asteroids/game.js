const Asteroid = require("./asteroid");

const DEFAULTS = {
  DIM_X: 100,
  DIM_Y: 100,
  NUM_ASTEROIDS: 10
};

function Game(){
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function (){
  for (var i = 0; i < DEFAULTS.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition()));
  }
};


Game.prototype.randomPosition = function (){
  return [Math.random() * 500, Math.random() * 500];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(100,100, 500,500);
  this.asteroids.forEach(function(el) {
    el.draw(ctx);
  });
};

Game.prototype.moveObjects = function(){

};

let game = new Game;
console.log(game.asteroids[0].pos);
module.exports = Game;
