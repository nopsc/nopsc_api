require 'test_helper'

class MailSubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_subscriber = mail_subscribers(:one)
  end

  test "should get index" do
    get mail_subscribers_url, as: :json
    assert_response :success
  end

  test "should create mail_subscriber" do
    assert_difference('MailSubscriber.count') do
      post mail_subscribers_url, params: { mail_subscriber: { email: @mail_subscriber.email } }, as: :json
    end

    assert_response 201
  end

  test "should show mail_subscriber" do
    get mail_subscriber_url(@mail_subscriber), as: :json
    assert_response :success
  end

  test "should update mail_subscriber" do
    patch mail_subscriber_url(@mail_subscriber), params: { mail_subscriber: { email: @mail_subscriber.email } }, as: :json
    assert_response 200
  end

  test "should destroy mail_subscriber" do
    assert_difference('MailSubscriber.count', -1) do
      delete mail_subscriber_url(@mail_subscriber), as: :json
    end

    assert_response 204
  end
end
