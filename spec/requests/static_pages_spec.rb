require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before { visit root_path }
    
    it "should have the content 'Home'" do
      expect(page).to have_content('Home')
    end

    it "should have the title 'Twitstagram'" do
      expect(page).to have_title("Twitstagram")
    end

    it "should not have the title 'Home'" do
      expect(page).not_to have_title("Home")    
    end

  end  

  describe "About page" do
    before { visit about_path }
    
    it "should have the content 'About'" do
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      expect(page).to have_title("Twitstagram | About")
    end
  
  end


  describe "Contact page" do
    before { visit contact_path }

    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_content('Contact Us')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("Twitstagram | Contact")
    end
  
  end

  describe "TnC page" do
    before { visit tnc_path }

    it "should have the content 'Terms and Conditions'" do
      expect(page).to have_content('Terms and Conditions')
    end

    it "should have the title 'Terms and Conditions'" do
      expect(page).to have_title("Twitstagram | Terms and Conditions")
    end

  end

  describe "Admin page" do
    before { visit admin_path }

    it "should have the content 'Admin'" do
      expect(page).to have_content('Admin')
    end

    it "should have the title 'Admin'" do
      expect(page).to have_title("Twitstagram | Admin")
    end

    it "should have a link to 'Create group'" do
      expect(page).to have_content('Create group')
      click_link('Create group')
      expect(page). to have_title("Create group")
    end

  end

  describe "Application layout" do
    before { visit root_path }

    it "should have header and footer" do
      expect(page).to have_content('Header')
      expect(page).to have_content('Footer')
    end
  
  end


end
