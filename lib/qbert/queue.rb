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

    def pop
      return nil if @head.nil?
      entry = @head
      @head = @head.next

      entry
    end

    def reverse!
      return if @head.nil?

      @tmp_head = self.pop
      @tmp_head.next = nil
      @tail = @tmp_head

      until @head.nil?
        entry = self.pop
        entry.next = @tmp_head
        @tmp_head = entry
      end

      @head = @tmp_head
    end
  end
end
