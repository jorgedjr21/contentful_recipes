# frozen_string_literal: true

class Recipe < ContentfulModel::Base
  has_one :photo
  has_many :tags
  self.content_type_id = 'recipe'

end
