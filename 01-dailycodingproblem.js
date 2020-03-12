// Given a list of numbers and a number 'k'. Return whether any two
// numbers from this list add up to 'k'.

//initial set of numbers
const numbers = [10,15,3,7];

// define sum to compare
const sum = 17;

//prepare set of filtered arrays
console.log(numbers.map(item => {
  return [...numbers].filter(
    //filter out current iter item
    i => i != item).map(
      //iterate filtered, return when sum is true
      j => (j + item === sum)).includes(true);
}).includes(true)); // if match is found, return true
