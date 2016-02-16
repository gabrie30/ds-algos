function quickSort(array) {

  if (array.length <= 1) {
    return array;
  }

  var pivot = array[0];

  var left = find_left(pivot, array);
  var right = find_right(pivot, array);

  return quickSort(left).concat([pivot]).concat(quickSort(right));
}

function find_left(pivot, array) {

  var retArray = [];
  for(var i = 0; i<array.length; i++) {
    if( array[i] < pivot) {
      retArray.push(array[i]);
    }
  }

  return retArray;
}

function find_right(pivot, array) {

  var retArray = [];
  for(var i = 0; i<array.length; i++) {
    if( array[i] > pivot) {
      retArray.push(array[i]);
    }
  }
  return retArray;
}

var a = quickSort([4,3,2,1]);
console.log(a);