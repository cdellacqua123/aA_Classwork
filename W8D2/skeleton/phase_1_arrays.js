Array.prototype.uniq = function() {
    let answer = [];
    this.forEach(element => {
       if (!answer.includes(element)) {
        answer.push(element);
       }
    });
    console.log(answer);
};



Array.prototype.twoSum = function() {
    let answer = [];
    for (let i = 0; i < this.length; i++) {
        for (let y = (i + 1); y < this.length; y++) {
            if (this[i] + this[y] === 0) {
                answer.push([i, y]);
            }
        }
    }
    console.log(answer);
    return answer;
};

[-1, 2, -2, 1].twoSum()
// Array.prototype.twoSum = function() {
//     let answer = [];
//     this.forEach(element => {
//         this.forEach(element2 => {
//             if (element + element2 === 0) {
//                 answer.push([this.indexOf(element), this.indexOf(element2)]);
//             }
//         })
//     });
//     console.log(answer);
// }

Array.prototype.transpose = function() {
    let answer = [];
    for (let i = 0; i < this[0].length; i++) {
        let temp = []; 
        for (let y = 0; y < this.length; y++) {
            temp.push(this[y][i]);
        }
        answer.push(temp);
    }
    // return answer
    console.log(answer);
};

