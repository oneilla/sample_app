#require 'spec_helper'

describe StaticPagesController do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do

    describe "when not signed in" do

      before(:each) do
        get :home
      end

      it "should be successful" do
        response.should be_success
      end

      it "should have the right title" do
        response.body.should have_selector("title",
                                      :content => "#{@base_title} | Home")
      end
    end

    describe "when signed in" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end

      it "should have the right follower/following counts" do
        get :home
        response.body.should have_selector("a", :href => following_user_path(@user),
                                           :content => "0 following")
        response.body.should have_selector("a", :href => followers_user_path(@user),
                                           :content => "1 follower")
      end
    end
  end

=begin
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
=end 


end
