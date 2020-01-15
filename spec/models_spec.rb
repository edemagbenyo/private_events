require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) { @user = User.new(name: "user-example", email: "example@email.com")}

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without a email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end
end


RSpec.describe Event, :type => :model do
  before(:all) { @user = User.create(name: "user-example", email: "example@email.com")}
  before(:each) { @event = @user.events.build(name: "event-example", location: "location-example", event_date: DateTime.now)}

  it "is valid with valid attributes" do
    expect(@event).to be_valid
  end

  it "is not valid without a name" do
    @event.name = nil
    expect(@event).to_not be_valid
  end

  it "is not valid without a location" do
    @event.location = nil
    expect(@event).to_not be_valid
  end

  it "is not valid withour a event_date" do
    @event.event_date = nil
    expect(@event).to_not be_valid
  end

  it "is passed events" do
    @event.save
    expect(Event.past.include?(@event)).to be true
  end

  it "is future events" do
    expect(Event.future.include?(@event)).to be false
  end
end
