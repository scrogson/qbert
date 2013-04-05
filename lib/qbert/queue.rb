module Qbert
  class Queue

    def initialize
      @head = @tail = nil
    end

    def prepend(entry)
      if @head.nil?
        @head = @tail = entry
      else
        entry.next = @head
        @head = entry
      end
    end

    alias_method :<<, :prepend

    def append(entry)
      if @head.nil?
        @head = @tail = entry
      else
        @tail.next = entry
        @tail = entry
      end
    end
  end
end
