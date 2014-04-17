require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the title 'Twitstagram'" do
      visit '/static_pages/home'
      expect(page).to have_title("Twitstagram")
    end

    it "should not have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).not_to have_title("Home")    
    end

  end  

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("Twitstagram | About")
    end
  end


  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Us')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("Twitstagram | Contact")
    end
  end

  describe "TnC page" do
    it "should have the content 'Terms and Conditions'" do
      visit '/static_pages/tnc'
      expect(page).to have_content('Terms and Conditions')
    end

    it "should have the title 'Terms and Conditions'" do
      visit '/static_pages/tnc'
      expect(page).to have_title("Twitstagram | Terms and Conditions")
    end

  end

  describe "Application layout" do
    it "should have header and footer" do
      visit '/static_pages/home'
      expect(page).to have_content('Header')
      expect(page).to have_content('Footer')
    end
  end


end
