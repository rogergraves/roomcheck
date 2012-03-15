require 'spec_helper'

describe CheckList do
  context "model fields" do
    it 'requires a name' do
      should_not be_valid
      subject.errors[:name].should_not be_empty
    end
  end
end
