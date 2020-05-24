# == Schema Information
#
# Table name: psychologies
#
#  id                  :integer          not null, primary key
#  category            :string
#  explanation         :text
#  field               :string
#  font_awesome_icon   :string
#  japanese_field_name :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_psychologies_on_category     (category)
#  index_psychologies_on_explanation  (explanation)
#
require 'rails_helper'

RSpec.describe Psychology, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
