require 'spec_helper'

describe "SearchPages" do
  subject { page }

  describe "Search form in home page" do
    before { visit root_path }
    
    it { should have_field("query") }

  end

  describe "Search results" do 
    before { visit root_path }
    let(:submit) { "Search" }

    describe "empty search" do
      before do
        fill_in "query", with: ''
      end
      
      it "should remain in current page" do
        click_button submit
        uri = URI.parse(current_url)
        expect("#{uri.path}").to include(root_path)
      end
    end

    describe "zero results" do 
      before do
        fill_in "query", with: 'zero'
      end

      it "should go to search page with zero results" do
        click_button submit
        uri = URI.parse(current_url)
        expect("#{uri.path}").to include("search/zero")
        expect(page).to have_content("No results found")
      end

    end

    describe "has results" do 
      before do
        Group.create(name: 'hahamanyss', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '')
        Group.create(name: 'manyss', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '')
        Group.create(name: 'hahamany', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '')
        Group.create(name: 'panggulo', description: 'Stalk the Ateneo WVT', category: 'Sports', photo: '')
        fill_in "query", with: 'many'
      end
      it "should go to search page with many results" do
        click_button submit
        uri = URI.parse(current_url)
        expect("#{uri.path}").to include("search/many")
        expect(page).to have_content("3 Results found")
      end
    end

    describe "results pagination" do
      before(:all) { 60.times { FactoryGirl.create(:group) } }
      after(:all)  { Group.delete_all }
      let(:query) { "roup" }
      

      it "should list each group" do
        fill_in "query", with: query
        click_button submit
        expect(page).to have_selector('div.pagination')
        expect(page).to have_content("60 Results found")
        Group.where("name like ?", "%#{query}%").paginate(page: 1).each do |group|
          expect(page).to have_selector('li', text: group.name)
        end
      end

    end

  end

  describe "Search all" do 
    before { visit "/search" }
    before(:all) { 60.times { FactoryGirl.create(:group) } }
    after(:all)  { Group.delete_all }
      
    it "should have a paginated list of groups" do
      expect(page).to have_selector('div.pagination')
      expect(page).to have_content("60 Results found")
      Group.all.paginate(page: 1).each do |group|
        expect(page).to have_selector('li', text: group.name)
      end
    end
  end

  describe "Category listing" do
  
  end

  describe "Category search" do

  end



end
