# frozen_string_literal: true

class Tag < ContentfulModel::Base
  belongs_to_many :recipes
  self.content_type_id = 'tag'
end
