require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should add the user to the organization and set him as the owner" do
    @organization = Organization.new(:name => "Pedreira", :site_name => "pedreira")
    post :create, :organization => @organization.attributes
    assert assigns(:organization).valid?
    assert assigns(:organization).owner == @user
    assert assigns(:organization).users.size == 1, 'The organization was not associated to current user'
    assert_redirected_to(:controller => "home")
  end
  
  test 'only the owner can edit the organization' do
    @organization = organizations(:one)
    post :edit, :id => @organization.id
  end

  test 'the ordinary user should not edit an organization' do
    @organization = organizations(:two)
    post :edit, :id => @organization.id
    assert_redirected_to(:controller => "projects")
  end

  #test 'only the owner should be able to add new users to the organization' do
  #  @organization = organizations(:one)
  #  post :add_user, :new_user => @user.email
  #  assert_redirected_to(:action => "add_user")
  #end

  #test 'the ordinary user should not add users to an organization' do
  #  @user = users(:two)
  #  post :add_user, :organization_id => @organization.id, :new_user => @user.email
  #  assert_redirected_to(:controller => "home")
  #end

end