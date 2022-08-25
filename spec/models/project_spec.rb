# require 'rails_helper'


RSpec.describe Project, type: :model do
  it "should not be created" do
    p1 = Project.new("title": 123)
    expect(p1.title).to eq "1234"
  end
end
