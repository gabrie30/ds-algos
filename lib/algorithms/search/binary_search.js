var binarySearch = function(array, target, min, max) {

    min = typeof min != "undefined" ? min : 0;
    max = typeof max != "undefined" ? max : array.length-1;

    if (min > max) {
      return "not found";
    }

    var mid = Math.floor((min + max)/2);

    if (array[mid] == target) {
      return mid;
    }

    if (array[mid] > target) {
      // go left
      return binarySearch(array, target, min, mid-1);
    } else if (array[mid] < target) {
      // go right
      return binarySearch(array, target, mid+1, max);
    }
};