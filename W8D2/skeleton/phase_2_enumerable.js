Array.prototype.myEach = function(cb) {
  for(let i= 0; i < this.length; i++){
  // debugger 
   console.log((this[i]))
  }
};

Array.prototype.myMap = function(cb) {
  for(let i= 0; i < this.length; i++){
  // debugger 
   console.log((cb(this[i]))
  }
};


function cally(num) {
  return num * 2;
};

// [1,2,3].myEach(cally)