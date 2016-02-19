// implement a queue using two stacks

function Stack() {
  this.store = [];
}

Stack.prototype.push = function(el) {
  this.store.push(el);
};

Stack.prototype.pop = function() {
  return this.store.pop();
};

Stack.prototype.size = function() {
  return this.store.length;
};


function Queue() {
  this.firstStack = new Stack();
  this.secondStack = new Stack();
}

Queue.prototype.enqueue = function(el) {
  // enqueue: adds an item to the end of your queue
  if ( this.firstStack.size === 0) {
    this.secondStack.push(el);
  } else {
    this.firstStack.push(el);
  }
};

Queue.prototype.dequeue = function() {
  // dequeue: removes and returns the first item of your queue
  // if the first stack has elements in it, put all elements into the second stack
  // pop element off the end of the second stack
  // then put all elements back into the first stack
  while (this.firstStack.size() > 0) {
    this.secondStack.push(this.firstStack.pop());
  }

  this.secondStack.pop();

  while(this.secondStack.size() > 0) {
    this.firstStack.push(this.secondStack.pop());
  }
};

var myQueue = new Queue();
myQueue.enqueue(1);
myQueue.enqueue(2);
myQueue.enqueue(3);
myQueue.enqueue(4);
myQueue.enqueue(5);
myQueue.enqueue(6);

myQueue.dequeue();
myQueue.dequeue();

console.log(myQueue);