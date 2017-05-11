require "spec_helper"

describe(Recipe) do
  describe('#ingredients') do
    it { have_and_belong_to_many (:ingredients) }
  end
  describe('#tags') do
    it { have_and_belong_to_many(:tags)}
  end
end
