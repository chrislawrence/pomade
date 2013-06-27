require 'spec_helper'

describe FancyUrls do
  it 'generates a list of all routes' do
    FancyUrls.new.initial_path_segments.should_not be_nil
  end
end
