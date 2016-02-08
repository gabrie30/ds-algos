function flatten(array) {
    var answer = [];
    
    function find(array) {
        for(var i=0; i<array.length; i++) {
            if (array[i].constructor === Array) {
                find(array[i]);
            } else {
                answer.push(array[i]);
            }
        }
    }

    find(array);
    return answer;
}

flatten([[1,9],[3,4],[5,[6,[7]]]]);
