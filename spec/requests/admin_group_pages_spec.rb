require 'spec_helper'

describe "Group Pages" do
  subject { page }

  describe "index" do
    before { visit "/admin/groups" }

    it { should have_title('Groups') }
    it { should have_content('All Groups') }
    it { should have_content('Create new group') }

    describe "pagination" do

      before(:all) { 60.times { FactoryGirl.create(:group) } }
      after(:all)  { Group.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each group" do
        Group.paginate(page: 1).each do |group|
          expect(page).to have_selector('li', text: group.name)
          expect(page).to have_link("Delete", href: "/admin/groups/#{group.id}/delete")

        end
      end
    end

  end

  ###########
  describe "edit" do 
    let(:group) { FactoryGirl.create(:group) }
    before { visit "/admin/groups/#{group.id}/edit" }
    let(:submit) { "Submit" }

    describe "page" do
      it { should have_content("Update group") }
      it { should have_title("Update group") }
    end

    describe "with invalid information" do
      let(:new_name)  { "" }
      let(:new_description)  { "" }
      it "should not edit the group" do
        fill_in "Name", with: new_name
        click_button submit
        expect(page).to have_content("Error")
      end
    end

    describe "with valid information" do 
      let(:new_name)  { "New Name" }
      let(:new_description) { "New description" }
      let(:new_category) { "new_category" }
      let(:submit) { "Submit" }

      before do
        fill_in "Name",             with: new_name
        fill_in "Description",      with: new_description
        fill_in "Category",         with: new_category
        click_button submit
      end

      it { should have_title(new_name) }
      it { should have_content("Group updated") }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(group.reload.name).to  eq new_name }
      specify { expect(group.reload.description).to eq new_description }
    end

    #TODO: Test when the user submits an update to a non-existing group.id

    #TODO: Test when the user goes to edit of a non-existing group.id

  end

  ###########
  describe "show" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit "/admin/groups/#{group.id}" }

    it { should have_content(group.name) }
    it { should have_content(group.description) }
    it { should have_title(group.name) }
    it { should have_link("Edit") }
    
  end

  ###########
  describe "create" do 
    before { visit '/admin/groups' }
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
        expect(page).to have_content("Group added")
        expect(page).to have_selector('div.alert.alert-success')

        expect("#{uri.path}").to include("admin/groups/")
      end
    
    end
  
  end

  ###########
  describe "destroy" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit "/admin/groups/#{group.id}/delete" }

    it "should be deleted" do
      expect(page).to have_content("Delete success")
      expect(Group.find_by_id(group.id) == nil)
      uri = URI.parse(current_url)
      expect("#{uri.path}").to include("admin/groups")
    end
  end

end
