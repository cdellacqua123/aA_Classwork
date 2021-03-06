function sum() {
    let sum = 0
    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
};

function sum2(...args) {
    let sum = 0
    for (let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    return sum;
};

// console.log(sum2(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 15);



class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
Function.prototype.myBind1 = function (context) {
    let args = Array.prototype.slice.call(arguments, 1)
    return () => {
        return this.apply(context, args);
    }
};


// markov.says.myBind1(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// no bind time args (other than context), call time args are "meow" and "a tree"
Function.prototype.myBind2 = function (context) {
    return (...args) => {
        return this.apply(context, args);
    }
}


// markov.says.myBind2(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
Function.prototype.myBind3 = function (context) {
    let args = Array.prototype.slice.call(arguments, 1)
    return (...args2) => {
        let allArgs = args.concat(args2)
        return this.apply(context, allArgs);
    }
};

// markov.says.myBind3(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

Function.prototype.myBind4 = function(context) {
    // let that = this;
    return (...args) => {
        return this.apply(context, args);
    };
}

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind4(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true


