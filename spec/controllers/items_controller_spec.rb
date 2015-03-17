require 'spec_helper'

describe ItemsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:category) { Category.create!(name: 'Foo') }
    let(:item) do
      category.items.create!(name: 'Bar', description: 'Baz', price: 10)
    end

    it "returns http success" do
      get 'show', id: item.id

      response.should be_success
    end
  end

end
