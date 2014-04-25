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

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name + " information") }
  end
end