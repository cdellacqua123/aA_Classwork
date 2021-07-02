function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
Function.prototype.curry = function(num1) {
    const args = [];
    return function _curriedAdd(num) {
        args.push(num);
        let result = args.reduce((acc, el) => acc + el);
        console.log(result);
        return _curriedAdd;
    };
};

// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30

function curriedSum(numArgs) {
    const numbers = [];
    return function _curriedSum(num) {
        if (numbers.length === numArgs) {
            let sum = numbers.reduce((acc, el) => acc + el);
            return sum;
        } else {
            numbers.push(num);
            console.log(numbers);
        }
        return _curriedSum;
    }
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56