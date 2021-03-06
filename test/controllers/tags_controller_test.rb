require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end
#CircleCIの結果をSlackに通知する
  test "should get index" do
    get tags_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_url
    assert_response :success
  end

  # test "should create tag" do
  #   assert_difference('Tag.count') do
  #     post tags_url, params: { tag: { content: @tag.content, deleted_at: @tag.deleted_at, name: @tag.name } }
  #   end
  #
  #   assert_redirected_to tag_url(Tag.last)
  # end

  test "should show tag" do
    get tag_url(@tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    patch tag_url(@tag), params: { tag: { content: @tag.content, deleted_at: @tag.deleted_at, name: @tag.name } }
    assert_redirected_to tag_url(@tag)
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_url
  end
end
