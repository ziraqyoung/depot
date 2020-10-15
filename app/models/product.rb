class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_lineitem
  
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
                with: %r{\.(gif|jpg|png)\Z}i,
                message: "must be a URL for GIF, JPG or PNG image.",
              }

  private
    # Ensure there are no line items referencing thi=s product (Edge case)
    def ensure_not_referenced_by_any_lineitem
      unless line_items.empty?
        errors.add(:base, 'Line items present')
        throw :abort
      end
    end
end
