require 'spec_helper'

describe "StaticPages" do
  describe "About page" do

    it "should have the content 'About Twitstagram'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Twitstagram')
    end
  end


  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Us')
    end
  end

  describe "TnC page" do
    it "should have the content 'Terms and Conditions'" do
      visit '/static_pages/tnc'
      expect(page).to have_content('Terms and Conditions')
    end
  end

end
