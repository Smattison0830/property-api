require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should create property" do
    assert_difference("Property.count") do
      post properties_url, params: property_payload, as: :json
    end

    assert_response :created
  end

  test "should not create property without unique id" do
    assert_no_difference("Property.count") do
      post properties_url, params: property_payload(unique_id: nil), as: :json
    end

    assert_response :unprocessable_content
    body = response.parsed_body
    assert body.key?("unique_id"), "expected validation error on unique_id, got: #{body.inspect}"
  end

  test "should not create property without property name" do
    assert_no_difference("Property.count") do
      post properties_url, params: property_payload(property_name: nil), as: :json
    end

    assert_response :unprocessable_content
    body = response.parsed_body
    assert body.key?("property_name"), "expected validation error on property_name, got: #{body.inspect}"
  end

  test "should require room number for non house property" do
    params = property_payload(room_number: nil, type_of_property: "mansion")

    assert_no_difference("Property.count") do
      post properties_url, params:, as: :json
    end

    assert_response :unprocessable_content
    body = response.parsed_body
    assert body.key?("room_number"), "expected validation error on room_number, got: #{body.inspect}"
  end

  test "should get index" do
    get properties_url, as: :json
    assert_response :success
  end

  test "should show property" do
    get property_url(@property), as: :json
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: property_payload, as: :json
    assert_response :success
  end

  test "should destroy property" do
    assert_difference("Property.count", -1) do
      delete property_url(@property), as: :json
    end

    assert_response :no_content
  end

  private

    def property_payload(overrides = {})
      {
        property: {
          unique_id: @property.unique_id,
          property_name: @property.property_name,
          address: @property.address,
          room_number: @property.room_number,
          rent: @property.rent,
          size: @property.size,
          type_of_property: @property.type_of_property
        }.merge(overrides)
      }
    end
end
