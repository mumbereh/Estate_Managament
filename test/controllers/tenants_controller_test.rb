require "test_helper"

class TenantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant = tenants(:one)
  end

  test "should get index" do
    get tenants_url
    assert_response :success
  end

  test "should get new" do
    get new_tenant_url
    assert_response :success
  end

  test "should create tenant" do
    assert_difference("Tenant.count") do
      post tenants_url, params: { tenant: { email: @tenant.email, first_name: @tenant.first_name, home_district: @tenant.home_district, last_name: @tenant.last_name, next_of_kin: @tenant.next_of_kin, room_id: @tenant.room_id, village: @tenant.village } }
    end

    assert_redirected_to tenant_url(Tenant.last)
  end

  test "should show tenant" do
    get tenant_url(@tenant)
    assert_response :success
  end

  test "should get edit" do
    get edit_tenant_url(@tenant)
    assert_response :success
  end

  test "should update tenant" do
    patch tenant_url(@tenant), params: { tenant: { email: @tenant.email, first_name: @tenant.first_name, home_district: @tenant.home_district, last_name: @tenant.last_name, next_of_kin: @tenant.next_of_kin, room_id: @tenant.room_id, village: @tenant.village } }
    assert_redirected_to tenant_url(@tenant)
  end

  test "should destroy tenant" do
    assert_difference("Tenant.count", -1) do
      delete tenant_url(@tenant)
    end

    assert_redirected_to tenants_url
  end
end
