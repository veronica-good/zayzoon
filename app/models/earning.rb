class Earning < ApplicationRecord
  require 'csv';
  belongs_to :employee

  MAP = {
    "EmployeeNumber" => :external_ref,
    "employee" => :external_ref,
    "CheckDate" => :earning_date,
    "earningDate" => :earning_date,
    "Amount" => :amount,
    "netAmount" => :amount
  }
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      data = {}
      row.to_hash.each do |k, v|
        key = MAP[k]
        data[key] = v
      end
      if data[:earning_date].match(/\d{4}-\d{2}-\d{2}/)
        data[:earning_date].to_date
      else
        data[:earning_date] = Date.strptime(data[:earning_date], '%m/%d/%Y')
      end
      employee = Employee.find_by(external_ref: data[:external_ref])
      employee.earnings.create(
        earning_date: data[:earning_date],
        amount: data[:amount].gsub(/[^\d\.]/, '')
      )
    end
  end

end
