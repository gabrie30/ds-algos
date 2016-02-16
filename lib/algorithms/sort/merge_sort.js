function mergeSort(array) {

    if (array.length <= 1) {
        return array;
    }
    
    var mid = Math.floor(array.length/2);
    var left = mergeSort(array.slice(0,mid));
    var right = mergeSort(array.slice(mid));
    
    return merge(left, right);
}

function merge(left, right) {
    var answer = [];

    while(left.length > 0 && right.length > 0) {
        if(left[0] < right[0]) {
            answer.push(left.shift());
        } else {
            answer.push(right.shift());
        }
    }
    
    if (left.length) {
        while(left.length >= 1) {
            answer.push(left.shift());
        }
    }
    
    if(right.length) {
        while(right.length >= 1) {
            answer.push(right.shift());
        }
    }
    
    return answer;
}

mergeSort([4,3,2,1]);