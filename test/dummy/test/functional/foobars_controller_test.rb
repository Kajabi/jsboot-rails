require 'test_helper'

class FoobarsControllerTest < ActionController::TestCase
  test "jsboot_data_tag helper renders as expected" do
    get :index

    assert_select 'script#jsboot-testing.jsboot-data' do |tag|
      assert_match /\{"foobar":"fizzbuzz"\}/, tag[0].to_s
    end
  end

  test "jsboot_data_tag will convert resources#show to resources-show" do
    get :index

    assert_select 'script#jsboot-resources-show.jsboot-data' do |tag|
      assert_match /\{"replaced":"ok"\}/, tag[0].to_s
    end
  end

  test "jsboot_data_tag will default controller#action as the key" do
    get :index

    assert_select 'script#jsboot-foobars-index.jsboot-data' do |tag|
      assert_match /\{"automagic":"key"\}/, tag[0].to_s
    end
  end

  test "jsboot_data_tag will ensure {} as the data" do
    get :index

    assert_select 'script#jsboot-no-data.jsboot-data' do |tag|
      assert_match /\{}/, tag[0].to_s
    end
  end
end
