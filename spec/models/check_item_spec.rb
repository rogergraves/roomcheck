require 'spec_helper'

describe CheckItem do
  context "model fields"
    it 'requires a name' do
      should_not be_valid
      subject.errors[:name].should_not be_empty
    end
  end
    context "when area is nil"
      it 'contains a unique name' do
      end
    end
end
