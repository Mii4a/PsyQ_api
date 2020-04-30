require 'test_helper'

class WorkbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workbook = workbooks(:one)
  end

  test "should get index" do
    get workbooks_url, as: :json
    assert_response :success
  end

  test "should create workbook" do
    assert_difference('Workbook.count') do
      post workbooks_url, params: { workbook: { subject_explanation: @workbook.subject_explanation, subject_name: @workbook.subject_name } }, as: :json
    end

    assert_response 201
  end

  test "should show workbook" do
    get workbook_url(@workbook), as: :json
    assert_response :success
  end

  test "should update workbook" do
    patch workbook_url(@workbook), params: { workbook: { subject_explanation: @workbook.subject_explanation, subject_name: @workbook.subject_name } }, as: :json
    assert_response 200
  end

  test "should destroy workbook" do
    assert_difference('Workbook.count', -1) do
      delete workbook_url(@workbook), as: :json
    end

    assert_response 204
  end
end
