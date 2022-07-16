require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(name: "test", description: "test", price: "24", category_id: "2")
  end

  test "name should be present" do
    @item.name = ""
    assert_not @item.valid?
  end

  test "description should be present" do
    @item.description = ""
    assert_not @item.valid?
  end

  test "price should be present" do
    @item.price = ""
    assert_not @item.valid?
  end

  test "category_id should be present" do
    @item.category_id = ""
    assert_not @item.valid?
  end

  test "name should be less than 101 characters" do
    @item.name = "a" * 101
    assert_not @item.valid?
  end

  test "description should be less than 1001 characters" do
    @item.description = "a" * 1001
    assert_not @item.valid?
  end

  test "price should be greater than 0" do
    @item.price = "0"
    assert_not @item.valid?
  end

  test "category_id should be greater than 0" do
    @item.category_id = "0"
    assert_not @item.valid?
  end

  test "name must be greater than 3 character" do
    @item.name = "a" * 2
    assert_not @item.valid?
  end

  test "description must be greater than 10 character" do
    @item.description = "a" * 9
    assert_not @item.valid?
  end
end
