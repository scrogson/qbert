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
  let(:head) { queue.instance_variable_get :@head }
  let(:tail) { queue.instance_variable_get :@tail }

  describe "#initialize" do
    it "is empty on initialization" do
      head.should be_nil
      tail.should be_nil
    end
  end

  describe "#prepend (#<<)" do

    context "when empty" do

      let(:entry) { Entry.new('Test') }

      before do
        queue << entry
      end

      its "head doesn't have a next object" do
        entry.next.should be_nil
      end

      its "head and tail are the same entry" do
        head.should eq tail
      end

      it "adds an entry to the queue" do
        entry.data.should eq 'Test'
      end
    end

    context "when an entry exists" do

      let(:first_entry) { Entry.new('first') }
      let(:second_entry) { Entry.new('second') }

      before do
        queue << first_entry
        queue << second_entry
      end

      it "adds an entry to the head of the queue" do
        head.should eq second_entry
        head.next.should eq first_entry
        tail.should eq first_entry
      end
    end
  end
end
