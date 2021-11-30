let dolphins = calcAverage(44, 23, 71);
let koalas = calcAverage(65, 54, 49);
console.log(dolphins, koalas);
const checkWinner = function (avgDolphins, avgKoalas) {
  if (avgDolphins >= 2 * avgKoalas) {
    console.log(`Dolphins win (${avgDolphins} vs. ${avgKoalas})`);
  } else if (avgKoalas >= 2 * avgDolphins) {
    console.log(`Koalas win (${avgKoalas} vs. ${avgDolphins})`);
  } else {
    console.log("No one wins");
  }
};
checkWinner(dolphins, koalas);
checkWinner(576, 111);
