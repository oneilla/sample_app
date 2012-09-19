require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    visit '/'
    page.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    visit '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    visit '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    visit '/help'
    response.should have_selector('title', :content => "Help")
  end
end
