class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    // this.game.playMove();
    // debugger
    const li = $('li');
    li.on('click', (event)=>{
      // debugger
      event.currentTarget.textContent = this.game.currentPlayer;
      const currentTarget = $(event.currentTarget);
      this.makeMove(currentTarget);
      if (this.game.board.isOver()){
        alert('gooood shit');
      }
    });
  }

  makeMove($square) {
    const x = $square.data("x");
    const y = $square.data("y");
    const pos = [x,y];
    this.game.playMove(pos);
  }

  setupBoard() {
    //add class , append create
    const $ul = $("ul");
    const board = this.game.board.grid;
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[0].length; j++) {
        const li = document.createElement('li');
        const $li = $(li);
        $li.data("x",i);
        $li.data("y",j);
        $li.textContent = "";
        $ul.append($li);
      }
    }

    // for(let i = 0; i < 9; i++){
    //   const li = document.createElement('li');
    //   li.textContent = "";
    //   $ul.append(li);
    // }




  }
}

module.exports = View;
