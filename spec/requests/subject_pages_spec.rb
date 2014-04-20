require 'spec_helper'

describe "Subject Pages" do
  subject { page }

  describe "show" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit "/admin/groups/#{group.id}" }

    describe "subject creation" do
      
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

    describe "subject display" do
      

    end

  end


end
