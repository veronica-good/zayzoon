class Earning < ApplicationRecord
  require 'csv';
  belongs_to :employee

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      row.to_hash
      # employee = Employee.find_by(external_ref: data[:external_ref])
      # employee.earnings.create(
      #   earning_date: data[:earning_date],
      #   amount: data[:amount].gsub(/[^\d\.]/, '')
      # )
    end
  end

  # class RecordParser
  #   def initialize(fields)
  #     @fields = fields
  #   end
  # end
end
