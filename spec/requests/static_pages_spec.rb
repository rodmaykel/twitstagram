require 'spec_helper'

describe "StaticPages" do
  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("About")
    end
  end


  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Us')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("Contact")
    end
  end

  describe "TnC page" do
    it "should have the content 'Terms and Conditions'" do
      visit '/static_pages/tnc'
      expect(page).to have_content('Terms and Conditions')
    end

    it "should have the title 'Terms and Conditions'" do
      visit '/static_pages/tnc'
      expect(page).to have_title("Terms and Conditions")
    end

  end

end
