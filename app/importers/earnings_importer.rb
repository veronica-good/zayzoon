class EarningsImporter
  # @example
  #  EarningsImporter.call(employer)
  #

  def self.call(employer, data)
    CSV.parse(data, headers: true).each do |row|
      employee = Employee.find_by(external_ref: row["EmployeeId"])
      employee.earnings.create(
        date: Date.strptime(row["CheckDate"], '%m/%d/%Y'),
        amount: row["Amount"].gsub(/[^\d\.]/, '')
      )
    end
  end
  
end
