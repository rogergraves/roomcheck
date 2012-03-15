require 'spec_helper'

describe "check_list/index.html.erb" do
  context "viewing checklist items" do
    it 'shows the list of checkitems' do
      @allcheckitems = CheckItem.all
    end
  end
end
