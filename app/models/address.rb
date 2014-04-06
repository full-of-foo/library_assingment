class Address < ActiveRecord::Base
  belongs_to :customer
  has_many :purchases, dependent: :destroy

  validates :line1,
            :city,
            :state,
            :country, presence: true, length: { minimum: 2 }
  validates :customer, presence: true
  validates :zip, length: { minimum: 2 }, :if => Proc.new {|a| !a.zip.blank? }
  validates :line2, length: { minimum: 2 }, :if => Proc.new {|a| !a.line2.blank? }

  def to_formatted_s
    attributes
      .select { |k, v|
          !["id", "updated_at", "customer_id", "created_at"].include?(k) && !v.nil?
        }.values.join(', ')
  end

end

