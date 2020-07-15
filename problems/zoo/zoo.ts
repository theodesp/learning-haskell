declare var process: any;

var stdin = process.openStdin();
var stdin_input = "";

stdin.addListener("data", function (input) {
  stdin_input += input;
});

stdin.addListener("end", function () {
  isSame(stdin_input);
});

function isSame(input: String): void {
  const zList = input.match(/z/g);
  const oList = input.match(/o/g);
  const zCount = zList ? zList.length : 0;
  const oCount = oList ? oList.length : 0;

  const same = zCount * 2 === oCount;
  if (same) {
    console.log("Yes");
  } else {
    console.log("No");
  }
}
