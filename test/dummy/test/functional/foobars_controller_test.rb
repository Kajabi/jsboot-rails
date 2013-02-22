require 'test_helper'

class FoobarsControllerTest < ActionController::TestCase
  test "jsboot_data_tag helper renders as expected" do
    get :index

    assert_select 'script#jsboot-testing.jsboot-data' do |tag|
      assert_match /\{"foobar":"fizzbuzz"\}/, tag[0].to_s
    end
  end
end
