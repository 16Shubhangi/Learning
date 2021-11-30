const massOfMark = 95;
const heightOfMark = 1.88;
const massOfJohn = 85;
const heightOfJohn = 1.76;

const BMIOfMark = massOfMark / heightOfMark ** 2;
const BMIOfJohn = massOfJohn / heightOfJohn ** 2;
console.log(BMIOfMark, BMIOfJohn);
if (BMIOfMark > BMIOfJohn) {
  console.log(`Mark's BMI (${BMIOfMark}) is higher than John (${BMIOfJohn})!`);
} else {
  console.log(`John's BMI (${BMIOfJohn}) is higher than Marks (${BMIOfMark})!`);
}
