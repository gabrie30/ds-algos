// Implement a Stack using a single Queue.  Your Stack will need to have two methods:

function Queue() {
  this.store = [];
}

Queue.prototype.enqueue = function(el) {
  return this.store.push(el);
};

Queue.prototype.dequeue = function() {
  return this.store.shift();
};

Queue.prototype.isEmpty = function() {
  if (this.store.length === 0) {
    return false;
  } else {
    return true;
  }
};

Queue.prototype.size = function() {
  return this.store.length;
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////

function Stack() {
  this.myQueue = new Queue();
}

Stack.prototype.push = function(el) {
  this.myQueue.enqueue(el);
};

Stack.prototype.pop = function() {
  for (var i=0; i < this.myQueue.size()-1; i++) {
    this.myQueue.enqueue((this.myQueue.dequeue()));
  }

  this.myQueue.dequeue();
};

var stack = new Stack();

stack.push(1);
stack.push(2);
stack.push(3);
stack.push(4);
stack.push(5);

stack.pop();
stack.pop();
stack.pop();
console.log(stack);