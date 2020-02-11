// Given a list of numbers ad a number 'k'. return whether any two
// numbers from this list add up to 'k'
let numbers = [10,15,3,7];
let k = 17;
console.log(numbers.map(item => {
  return [...numbers].filter(i => i != item).map(j => (j + item === k)).includes(true);
}).includes(true));
