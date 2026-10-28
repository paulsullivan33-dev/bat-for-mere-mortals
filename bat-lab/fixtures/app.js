// A tiny greeter for the lab.
const visitors = ["sam", "jo", "pri"];

function greet(name) {
  return `Hello, ${name}!`;
}

for (const name of visitors) {
  console.log(greet(name));
}
