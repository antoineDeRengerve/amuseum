class ExhibitionRoom < ApplicationRecord
  belongs_to :exhibition
  belongs_to :room
end
