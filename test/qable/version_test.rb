require "test_helper"

class Qable::VersionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Qable::VERSION
  end
end
