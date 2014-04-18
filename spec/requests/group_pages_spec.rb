require 'spec_helper'

describe "Group Pages" do
  subject { page }

  describe "group page" do

  end

  describe "create page" do
    before { visit '/admin/groups/new' }
    it { should have_content('Groups#new') }
    it { should have_title(full_title('Create group')) }
  end

  describe "submit" do 
    before { visit '/admin/groups/new' }
    let(:submit) { "Submit" }
    
    describe "with invalid information" do
      it "should not create a group" do
        expect { click_button submit }.not_to change(Group, :count)
        expect(page).to have_content("Error")
      end


    end

    describe "with valid information" do
      
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Description",  with: "Example description"
        fill_in "Category",     with: "Category"
        fill_in "Photo",        with: "this_is_the_photo"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Group, :count).by(1)
        uri = URI.parse(current_url)
        expect("#{uri.path}").to include("admin/groups/")
      end
    
    end
  
  end

end
