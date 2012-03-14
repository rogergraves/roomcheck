require 'spec_helper'

describe Unit do
  it 'requires a name' do
    should_not be_valid
    subject.errors[:name].should_not be_empty
  end
end
