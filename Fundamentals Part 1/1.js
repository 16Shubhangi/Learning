const massOfMark = 95;
const heightOfMark = 1.88;
const massOfJohn = 85;
const heightOfJohn = 1.76;

const BMIOfMark = massOfMark / heightOfMark ** 2;
const BMIOfJohn = massOfJohn / (heightOfJohn * heightOfJohn);
const higherBMI = BMIOfMark > BMIOfJohn;
console.log(BMIOfMark, BMIOfJohn, higherBMI);
