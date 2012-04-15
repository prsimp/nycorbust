require 'spec_helper'

describe ApplicationHelper do

  it "returns a correct full title if provided a page title" do
    page_title = "About"
    full_title(page_title).should == "About | NYCorBUST"
  end

end