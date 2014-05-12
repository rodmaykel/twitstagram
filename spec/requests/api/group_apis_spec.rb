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
        group.subjects.last.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "#{n}")
        group.subjects.last.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "#{n}")
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

  end

end
