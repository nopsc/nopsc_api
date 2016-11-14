require 'csv'

class Signature < ApplicationRecord
  validates_uniqueness_of :email, :allow_blank => true, :allow_nil => true

  def self.to_csv
    attributes = %w{email name zip created_at}

    CSV.generate(headers: true) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
