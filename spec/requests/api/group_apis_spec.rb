require 'spec_helper'

describe "Group APIs" do
  subject { page }
  let(:group) { FactoryGirl.create(:group_with_subjects) }
  before do
    5.times do |n|
        group.subjects.first.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "#{n}")
        group.subjects.first.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "#{n}")
    end
    3.times do |n|
        group.subjects.last.tweets.create!(text: "lorem ipsum", created: 2.hour.ago, photo: "photo", tweet_id: "#{n}")
        group.subjects.last.photos.create!(caption: "caption", created: 2.day.ago, photo: "photo", instagram_id: "#{n}")
    end
  end

  describe "index" do
    before do
      FactoryGirl.create(:group, name: "Los Angeles Lakers", category: "sports")
      FactoryGirl.create(:group, name: "Los Angeles Clippers", category: "sports")
      FactoryGirl.create(:group, name: "ShowTime", category: "entertainment")
    end

    it "shows all groups" do
      get '/api/groups', {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['groups'].length).to eq(4)
      expect(json['total']).to eq(4)
    end

    it "with query" do
      get '/api/groups?q=angeles', {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['groups'].length).to eq(2)
    end

    it "with category" do
      get '/api/groups?category=entertainment', {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['groups'].length).to eq(1)
    end

    it "with query and category" do
      get '/api/groups?category=sports&q=lakers', {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['groups'].length).to eq(1)
    end

    it "with empty result" do
      get '/api/groups?q=fhm', {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['groups'].length).to eq(0)
    end

    # TODO: testing of pagination
  
  end

  describe "group show" do
    it "with non-existing id" do
      get "/api/groups/1000000", {}, { "Accept" => "application/json" }
      expect(response.status).to eq(404)
      json = JSON.parse(response.body)
      expect(json['error_message']).to eq("Group not found") 
    end

    it "with existing id" do
      get "/api/groups/#{group.id}", {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['subjects'].length).to eq(40)
      expect(json['tweets'].length).to eq(8)
      expect(json['photos'].length).to eq(8)
      expect(json['name']).to eq(group.name)
      expect(json['description']).to eq(group.description)
      
    end
  end

  describe "subjects" do

    it "shows all subjects" do
      get "/api/groups/#{group.id}/subjects", {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['subjects'].length).to eq(40)
      expect(json['total']).to eq(40)
    end
  end

  describe "tweets" do
    it "shows all tweets" do
      get "/api/groups/#{group.id}/tweets", {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['tweets'].length).to eq(8)
      expect(json['total']).to eq(8)
    end
  
  end

  describe "photos" do
    it "shows all subjects" do
      get "/api/groups/#{group.id}/photos", {}, { "Accept" => "application/json" }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['photos'].length).to eq(8)
      expect(json['total']).to eq(8)
    end
  
  end


end
