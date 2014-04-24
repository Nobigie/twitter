require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit root_path }
    it "should have the content 'Twitter'" do
      expect(page).to have_content('Twitter')
    end

    it "should have the right title" do
      expect(page).to have_title("Twitter | Home")
    end
  end


  describe "Help page" do
    before { visit help_path }
    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end
    it "should have the right title" do
      expect(page).to have_title("Twitter | Help")
    end
  end

  describe "About page" do
    before { visit about_path }
    it "should have the content 'About Us'" do
      expect(page).to have_content('About Us')
    end
    it "should have the right title" do
      expect(page).to have_title("Twitter | About Us")
    end
  end

  describe "Contact page" do
    before { visit contact_path }
    it "should have the content 'Conctact'" do
      expect(page).to have_content('Contact')
    end
    it "should have the right title" do
      expect(page).to have_title("Twitter | Contact")
    end
  end


end