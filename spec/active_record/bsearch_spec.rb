require "spec_helper"

class Post < ActiveRecord::Base
  include ActiveRecord::Bsearch
end

RSpec.describe ActiveRecord::Bsearch do
  it "has a version number" do
    expect(ActiveRecord::Bsearch::VERSION).not_to be nil
  end

  describe 'bsearch' do
    before :all do
      Post.create(id: 1, created_at: Time.zone.parse('2011-10-01 00:00:00'))
      Post.create(id: 3, created_at: Time.zone.parse('2011-10-03 00:00:00'))
      Post.create(id: 5, created_at: Time.zone.parse('2011-10-05 00:00:00'))
    end

    it "return expected value" do
      expect(Post.bsearch(Time.zone.parse('2011-09-30 00:00:00'))).to be_nil
      expect(Post.bsearch(Time.zone.parse('2011-10-01 00:00:00'))).to be 1
      expect(Post.bsearch(Time.zone.parse('2011-10-02 00:00:00'))).to be_nil
      expect(Post.bsearch(Time.zone.parse('2011-10-03 00:00:00'))).to be 3
      expect(Post.bsearch(Time.zone.parse('2011-10-04 00:00:00'))).to be_nil
      expect(Post.bsearch(Time.zone.parse('2011-10-05 00:00:00'))).to be 5
      expect(Post.bsearch(Time.zone.parse('2011-10-06 00:00:00'))).to be_nil
    end
  end
end
