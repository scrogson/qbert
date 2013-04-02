require "spec_helper"

class Entry
  attr_accessor :data, :next

  def initialize(data = {})
    @data = data
    @next = nil
  end
end

describe Qbert::Queue do

  let(:queue) { Qbert::Queue.new }

  describe "#initialize" do
    it "is empty on initialization" do
      queue.instance_variable_get(:@head).should be_nil
      queue.instance_variable_get(:@tail).should be_nil
    end
  end

  describe "#prepend" do

    context "when empty" do

      it "adds an entry to the queue" do
        entry = Entry.new('Test')
        queue.prepend(entry)
        queue.instance_variable_get(:@head).should eq entry
        queue.instance_variable_get(:@tail).should eq entry
        entry.data.should eq 'Test'
        entry.next.should be_nil
      end
    end

    context "when an entry exists" do
      
      it "adds an entry and points next to the correct entry" do
        first_entry = Entry.new('first')
        second_entry = Entry.new('second')
        queue.prepend first_entry
        queue.prepend second_entry
        queue.instance_variable_get(:@head).should eq second_entry
        second_entry.next.should eq first_entry
        queue.instance_variable_get(:@tail).should eq first_entry
      end
    end
  end
end
