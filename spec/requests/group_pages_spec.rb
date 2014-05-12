require 'spec_helper'

describe "Group Pages" do
  subject { page }
  let(:group) { FactoryGirl.create(:group) }
  let(:subject_1) { group.subjects.create(twitter: "rodmaykel", instagram: "777777", name: "Subject One", photo: "photo") }
  let(:subject_2) { group.subjects.create(twitter: "rodmaykel2", instagram: "777777", name: "Subject Two", photo: "photo") }
  before do
    5.times do |n|
        subject_1.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "#{n}")
        subject_1.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "#{n}")
    end
    3.times do |n|
        subject_2.tweets.create!(text: "lorem ipsum", created: 1.hour.ago, photo: "photo", tweet_id: "#{n}")
        subject_2.photos.create!(caption: "caption", created: 1.day.ago, photo: "photo", instagram_id: "#{n}")
    end

  end

  describe "view" do
    before { visit "/groups/#{group.id}/#{group.name.parameterize}"}
    it {
      should have_content(subject_1.name)
      should have_content(subject_2.name)
    }
    
  end

  describe "tweets" do
    before { visit "/groups/#{group.id}/#{group.name.parameterize}/tweets"}
    it {
      subject_1.tweets.each do |tweet|
        should have_content(tweet.text)
      end
      subject_2.tweets.each do |tweet|
        should have_content(tweet.text)
      end
    }
  end

  describe "photos" do
    before { visit "/groups/#{group.id}/#{group.name.parameterize}/photos"}
    it {
      subject_1.photos.each do |photo|
        should have_content(photo.caption)
        should have_xpath("//img[@src='#{photo.photo}']")
      end
      subject_2.photos.each do |photo|
        should have_content(photo.caption)
        should have_xpath("//img[@src='#{photo.photo}']")
      end
    }

  end

  describe "tweet pagination" do
    #TODO
  end

  describe "photo pagination" do
    #TODO
  end

end
