/*
 * Given an array of integers, return a new array such that each element
 * at index i of the new array is the product of all the numbers in the
 * original array except the one at i.
 */

// define set of numbers
let numbers = [1,2,3,4,5];

// iterate set
console.log(numbers.map(item => {
  // remove unwanted iter value
  return [...numbers].filter(i => i != item);
  // iterate new filtered arrays
}).map(j => {
  // return product of array values
  return j.reduce((acc,l) => acc * l);
}));

/*
 * Run the Google Cloud Function version from the url below.
 * Feel free to change the numbers array values.
 *
 * https://us-central1-pivotes5.cloudfunctions.net/dcp-20200211?numbers=1,2,3,4,5
 *
*/
