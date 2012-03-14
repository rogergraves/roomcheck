require 'spec_helper'

describe CheckItem do
  context "model fields" do
    it 'requires a name' do
      should_not be_valid
      subject.errors[:name].should_not be_empty
    end
  end
    context "when area is nil" do
      it 'contains a unique name' do
        CheckItem.create! :name => 'sink'
        n = CheckItem.new :name => 'sink'
        n.should_not be_valid
        n.errors[:name].should_not be_empty
      end
    end
    
    context "when area is not nil" do
      it 'contains a unique name' do
        CheckItem.create! :name => 'sink', :area => 'kitchen'
        n = CheckItem.new :name => 'sink', :area => 'kitchen'
        n.should_not be_valid
        n.errors[:name].should_not be_empty
      end
      it 'can have the same name for different areas' do
        CheckItem.create! :name => 'sink', :area => 'kitchen'
        n = CheckItem.new :name => 'sink', :area => 'bathroom'
        n.should be_valid
        n.errors[:name].should be_empty
        puts n.errors.full_messages
      end
    end
    context "name is case insensitive" do
      it 'does not allow different cases for the same name' do
        CheckItem.create! :name => 'sink', :area => 'kitchen'
        n = CheckItem.new :name => 'Sink', :area => 'kitchen'
        n.should_not be_valid
        n.errors[:name].should_not be_empty
      end
    end
    context "when checking for name uniqueness" do
      it 'does not allow different cases for the same area' do
        CheckItem.create! :name => 'sink', :area => 'Kitchen'
        n = CheckItem.new :name => 'sink', :area => 'kitchen'
        n.should_not be_valid
        n.errors[:name].should_not be_empty
      end
    end
end
