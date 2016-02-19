function balancedParens(string) {

  var stack = [];

  for(var i=0; i<string.length; i++) {
    var current = string[i];
    if(current === "(" ) {
      stack.push(current);
    } else {
      if (stack.length < 1) {
        return false;
      }

      stack.pop();
    }
  }

  if (stack.length > 0) {
    return false;
  } else {
    return true;
  }
}

var answer = balancedParens("()()()");
console.log(answer);