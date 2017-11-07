/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(1);
const Asteroid = __webpack_require__(2);

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(2);

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


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const utils = __webpack_require__(3);
const movingObject = __webpack_require__(4);

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


/***/ }),
/* 3 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass) {
    let Surrogate = function(){};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate;
    childClass.prototype.constructor = childClass;
  }
};

module.exports = Util;


/***/ }),
/* 4 */
/***/ (function(module, exports) {

  function MovingObject(options){
    this.pos = options["pos"];
    this.vel = options["vel"];
    this.radius = options["radius"];
    this.color = options["color"];
  }

  MovingObject.prototype.draw = function (ctx){
    ctx.beginPath();
    ctx.arc(this.pos[0],this.pos[1], this.radius, 0, 2*Math.PI, true);
    ctx.strokeStyle = this.color;
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = this.color;
    ctx.fill();
  };

  MovingObject.prototype.move = function(){
    this.pos = [this.pos[0] + this.vel[0],this.pos[1] + this.vel[1] ];
  };


// let objectExample = new MovingObject({"pos": [150,150], "vel": [20,20], "radius": 50, "color": "blue"});

module.exports = MovingObject;


/***/ })
/******/ ]);