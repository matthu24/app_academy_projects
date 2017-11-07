const utils = require("./utils");
const movingObject = require("./moving_object");

function Asteroid(pos){
  this.color = "blue";
  this.radius = 40;

  movingObject.call(this,{"pos":pos,"vel": this.randomVec(4), "radius": this.radius,"color": this.color});

  // new movingObject({"pos": pos, "vel":[20,20], "radius": 50, "color": "blue"});


}

utils.inherits(Asteroid, movingObject);

Asteroid.prototype.randomVec = function(length){
  const deg = 2 * Math.PI * Math.random();
return this.scale([Math.sin(deg), Math.cos(deg)], length);
};

Asteroid.prototype.scale = function(vec,m){
   return [vec[0] * m, vec[1] * m];
};

module.exports = Asteroid;
