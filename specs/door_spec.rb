require_relative 'spec_helper'

describe "door" do
  before (:each) do
    @door_open_unlocked = Door.new("open", "unlocked")
    # @door_open_locked = Door.new("open", "locked"
    # @door_closed_unlocked = Door.new("closed", "unlocked")
    # @door_closed_locked = Door.new("closed", "locked")
  end

  describe "#initialize" do
    it "can create a new instance of Door" do
      @door_open_unlocked.must_be_instance_of(Door)
    end

    it "should handle strings consistently regardless of capitalization" do
      @capitalization_door = Door.new("OPEN", "UNLOCKED")
      @capitalization_door.position.must_equal("open")
      @capitalization_door.lock_status.must_equal("unlocked")
    end

    it "should be initalized with one of two values for position: open and closed" do
      proc { @attribute_check_door = Door.new("Ajar", "unlocked") }.must_raise Exception
    end

    it "should be initalized with one of two values for lock_status: locked and unlocked" do
      proc { @attribute_check_door = Door.new("open", '¯\_(ツ)_/¯') }.must_raise Exception
    end

  end

  describe "#set_inscription" do
    it "should set the inscription variable to a non-nil value if it is currently nil" do
      @door_open_unlocked.set_inscription("Your Message Here").must_equal("Your Message Here")
    end

    it "should not allow the inscription to be changed once set" do
      @door_open_unlocked.set_inscription("Your Message Here")
      @door_open_unlocked.set_inscription("Can I do the Thing?").wont_equal("Can I do the Thing?")
    end
  end

end
