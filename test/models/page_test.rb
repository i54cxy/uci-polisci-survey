# == Schema Information
#
# Table name: pages
#
#  id         :bigint(8)        not null, primary key
#  survey_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pagenum    :integer
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
