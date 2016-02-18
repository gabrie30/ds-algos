  class HashMap
    attr_accessor :buckets, :storage, :size

    def initialize
      @buckets = 8
      @storage = []
      @size = 0
      @resizing = false
    end

    def insert(key, value)
      idx = hash(key, @buckets)
      if @storage[idx] == nil
        @storage[idx] = []
      end

      @storage[idx].push([key, value])
      if @resizing == false
        @size += 1
        check_for_resize
      end
    end

    def delete(key)
      idx = hash(key, @buckets)
      if @storage[idx]
        @storage[idx].select! { |x| x[0] != key }
        @size -= 1
        check_for_resize
      else
        return nil
      end
    end

    def retrieve(key)
      idx = hash(key, @buckets)
      if @storage[idx]
        to_return = @storage[idx].select { |x| x[0] == key }
        to_return.empty? ? nil : to_return.flatten[1]
      else
        return nil
      end
    end

    def hash(str, buckets)
      hash = 5381

      str.split("").each do |i|
          char = i
          hash = ((hash << 5) + hash) + char.ord
      end

      return hash % buckets
    end

    def check_for_resize
      percentage_full = (@size.to_f / @buckets.to_f)
      if percentage_full > 0.75
        resize(@buckets*2)
      elsif percentage_full < 0.25 && @buckets > 8 
        resize(@buckets/2)
      end
    end

    def resize(new_size)
      @resizing = true
      @buckets = new_size
      old_storage = @storage
      @storage = []
      old_storage.each do |bucket|
        next if bucket == nil
        bucket.each do |item|
          insert(item[0], item[1])
        end
      end
       @resizing = false
    end
  end