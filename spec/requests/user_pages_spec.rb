require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "sign up page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it "should have the right title" do
      expect(page).to have_title("Twitter | Sign up")
    end
  end
end