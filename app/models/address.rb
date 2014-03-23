class Address < ActiveRecord::Base
  belongs_to :customer

  validates :line1,
            :city,
            :state,
            :country, presence: true, length: { minimum: 2 }
  validates :customer, presence: true
  validates :zip, length: { minimum: 2 }, :if => Proc.new {|a| !a.zip.blank? }
  validates :line2, length: { minimum: 2 }, :if => Proc.new {|a| !a.line2.blank? }

end

