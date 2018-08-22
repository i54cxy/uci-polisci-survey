# == Schema Information
#
# Table name: answers
#
#  id                 :bigint(8)        not null, primary key
#  description        :text
#  data               :jsonb
#  question_id        :bigint(8)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  survey_response_id :bigint(8)
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
