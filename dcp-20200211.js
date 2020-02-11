// Given a list of numbers and a number 'k'. Return whether any two
// numbers from this list add up to 'k'.
let numbers = [10,15,3,7];
let k = 17;
console.log(numbers.map(item => {
  return [...numbers].filter(i => i != item).map(j => (j + item === k)).includes(true);
}).includes(true));
