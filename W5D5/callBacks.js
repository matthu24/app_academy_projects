//class Clock object has three attributes hours, minutes and seconds
//setInterval is called in the clock constructor fcn: set interval executes a function at specified time intervals
//it sets the method _tick at one second intervals

//tick does two things: 1. increments seconds, which increments this.seconds +=1 like so
//and also prints time




class Clock {
  constructor() {
    // 1. Create a Date object.
    let current_time = new Date();
    // 2. Store the hours, minutes, and seconds.
    //current time is already an instance of Date so don't need to call prototype
    this.hours = current_time.getHours();
    this.minutes = current_time.getMinutes();
    this.seconds = current_time.getSeconds();
    // 3. Call printTime.
    //don't do this..

    // 4. Schedule the tick at 1 second intervals.
    //set interval(function,time) time in milliseconds
    //using closure so that this does not refer to window
    //need to bind _tick to this so that this can access this.hours,minutes,etc

    //two ways to setInterval that work:
    //using bind
    // setInterval(this._tick.bind(this),1000);

    //using arrow method style
    setInterval( ()=> {
      this._tick();
    },1000);

    //this does not work:
    // setInterval(this._tick,1000)

  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
     let time = `${this.hours}:${this.minutes}:${this.seconds}`;
     console.log(time);
  }

  _tick() {
     // 1. Increment the time by one second.
     this._incrementSeconds();

     // 2. Call printTime.
     //why do we need this?
     this.printTime();
   }

   _incrementSeconds() {
     // 1. Increment the time by one second.
     this.seconds += 1;
     //reset seconds if it's been a full minute, and all inrement minute
     if (this.seconds === 60) {
       this.seconds = 0;
       this._incrementMinutes();
     }
   }

   _incrementMinutes() {
     this.minutes += 1;
     if (this.minutes === 60){
       this.minutes = 0;
       this._incremetHours();
     }
   }

   _incrementHours() {
    this.hours += 1;
    if(this.hours ===24){
      this.hours = 0;
    }

   }
}

//create an instance of clock
const clock = new Clock();
