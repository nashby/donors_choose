$:.unshift("lib")
require 'donors_choose'

describe DonorsChoose::Project do
  let(:test_title) { "A test project" }

  it "is able to find projects near me" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:centerLat => "40.4405556", :centerLong => "-79.9961111").
      and_return(projects)

    results = DonorsChoose::Project.near_me("40.4405556", "-79.9961111")
    results.should eq(projects)
  end

  it "is able to find projects by zip code" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:zip => "15232").
      and_return(projects)

    results = DonorsChoose::Project.by_zip("15232")
    results.should eq(projects)
  end
end
