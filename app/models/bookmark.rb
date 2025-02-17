class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :album, optional: true
end
