require 'spec_helper'

describe "Subject Pages" do
  subject { page }

  describe "create" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit "/admin/groups/#{group.id}" }

    let(:name)  { "New Name" }  
    let(:twitter) { "New twitter" }
    let(:instagram) { "New instagram" }
    let(:photo) { "New photo" }
    let(:submit) { "Submit" }

    it { should have_content("Add subject") }

    describe "with invalid information" do 
      before do
        fill_in "Name",             with: ''
        fill_in "Twitter",          with: twitter
        fill_in "Instagram",        with: instagram
        fill_in "Photo",            with: photo
      end

      it "should not create a subject" do
        expect { click_button submit }.not_to change(Subject, :count)
        expect(page).to have_content("Error")
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",             with: name
        fill_in "Twitter",          with: twitter
        fill_in "Instagram",        with: instagram
        fill_in "Photo",            with: photo
      end

      it "should create a subject" do
        expect { click_button submit }.to change(Subject, :count).by(1)
        expect(page).to have_content("Subject added")
        uri = URI.parse(current_url)
        expect("#{uri.path}").to include("admin/groups/#{group.id}")
      end
    end

  end
  
  describe "subject list" do
    let(:group) { FactoryGirl.create(:group_with_subjects) }
    before { visit "/admin/groups/#{group.id}" }

    it { should have_content('Subjects under this group') }

    describe "pagination" do

      it { should have_selector('div.pagination') }

      it "should list each subject" do
        Subject.paginate(page: 1).each do |subject|
          expect(page).to have_selector('li', text: subject.name)
          expect(page).to have_link("Delete", href: "/admin/groups/#{group.id}/subjects/#{subject.id}/delete")
          #expect(page).to have_selector('td', text: subject.instagram)
        end
      end
    end

  end

  describe "empty subject list" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit "/admin/groups/#{group.id}" }

    it { should_not have_content('Subjects under this group') }
  end

  describe "destroy" do
    let(:group) { FactoryGirl.create(:group_with_subjects) }
    before { visit "/admin/groups/#{group.id}/subjects/#{group.subjects[0].id}/delete" }

    it "should be deleted" do
      expect(page).to have_content("Success")
      expect(Subject.find_by_id(group.subjects[0].id) == nil)
      uri = URI.parse(current_url)
      expect("#{uri.path}").to include("admin/groups/#{group.id}")
    end

  end

end
