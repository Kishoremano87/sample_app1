require 'spec_helper'

describe "Static pages" do
subject { page }

	describe "Home Page" do
		before { visit root_path }
	  	it { should have_selector('h1', text: 'Welcome to the Sample App') }
	  	it { should have_selector('title', text: full_title("")) }
	  	it { should_not have_selector('title', text: '| Home') }    
	end

	describe "Help page" do

		before { visit help_path }
		it { should have_selector('h1', :text => 'Help') }
		it { should have_selector('title', text: full_title("Help")) }
	end
	
	describe "About Page" do
		before { visit about_path}
		it { should have_content('About Us') }
		it { should have_selector('title', text: full_title("About Us")) }
	end

	describe "Contact Page" do
		before {visit contact_path}
		it { should have_content('Contact Us') }
		it { should have_selector('title', text: full_title("Contact Us")) }
	end

	it "should have the right link in the layout" do
		visit root_path

		click_link "About"
		page.should have_selector 'title', text: full_title("About Us")
		
		click_link "Home"
		page.should have_selector 'title', text: full_title("")

		click_link "Help"
		page.should have_selector 'title', text: full_title("Help")

		click_link "Contact"
		page.should have_selector 'title', text: full_title("Contact Us")
	end
end