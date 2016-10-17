require 'test_helper'

class SignaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signature = signatures(:one)
  end

  test "should get index" do
    get signatures_url, as: :json
    assert_response :success
  end

  test "should create signature" do
    assert_difference('Signature.count') do
      post signatures_url, params: { signature: { email: @signature.email, mail_opt_in: @signature.mail_opt_in, name: @signature.name, zip: @signature.zip } }, as: :json
    end

    assert_response 201
  end

  test "should show signature" do
    get signature_url(@signature), as: :json
    assert_response :success
  end

  test "should update signature" do
    patch signature_url(@signature), params: { signature: { email: @signature.email, mail_opt_in: @signature.mail_opt_in, name: @signature.name, zip: @signature.zip } }, as: :json
    assert_response 200
  end

  test "should destroy signature" do
    assert_difference('Signature.count', -1) do
      delete signature_url(@signature), as: :json
    end

    assert_response 204
  end
end
