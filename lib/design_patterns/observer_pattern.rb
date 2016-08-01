# Basic Observer Pattern
# One Publisher to many Subscribers
# Each time the publisher updates it will notify all of the subscribers

module Subject
  def initialize
    @subscribers = []
  end

  def add_subscriber(subscriber)
    @subscribers << subscriber
  end

  def delete_subscriber(subscriber)
    @subscribers.delete(subscriber)
  end

  def finish_story
    update_subscribers
  end

  private

  def update_subscribers
    @subscribers.each do |subscriber|
      subscriber.update(self)
    end
  end
end

class Columnist
  include Subject
  attr_reader :name

  def initialize(name)
    super()
    @name = name
  end
end

class Author
  include Subject
  attr_reader :name

  def initialize(name)
    super()
    @name = name
  end
end

class TimeMagazine

  def update(publisher)
    puts "Breaking from Time Magazine, #{publisher.name} just wrote a new story."
  end
end

class NewYorkTimes

  def update(publisher)
    puts "Breaking from New York Times, #{publisher.name} just wrote a new story."
  end
end


p = Author.new("Steven King")
c = Columnist.new("Walter Winchell")
t = TimeMagazine.new
m = NewYorkTimes.new

p.add_subscriber(t)
p.add_subscriber(m)

c.add_subscriber(t)
c.add_subscriber(m)

p.finish_story
c.finish_story
