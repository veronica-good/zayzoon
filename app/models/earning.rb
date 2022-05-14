class Earning < ApplicationRecord
  require 'csv';
  belongs_to :employee

  def self.import(file, employer_id)
    employer = Employer.find_by_id employer_id
    # puts "PARSER"
    # puts employer.fields
    parser = RecordParser.new(JSON.parse(employer.fields))
    CSV.foreach(file.path, headers: true) do |row|
      r = parser.parse_record(row.to_hash)
      employee = Employee.find_by(external_ref: r['external_ref'])
      employee.earnings.create(
        earning_date: r['earning_date'],
        amount: r['amount']
      )
    end
  end

  class RecordParser
    def initialize(fields)
      @fields = fields
    end

    def parse_record(data)
      result = {}
      data.each do |header, value|
        data_type = @fields[header]
        if data_type['type'] == 'string'
          result[data_type['field']] = value
        elsif data_type['type'] == 'date'
          result[data_type['field']] = Date.strptime(value, data_type['format']).iso8601
        elsif data_type['type'] == 'decimal'
            result[data_type['field']] = value.gsub(/[^\d\.]/, '')
        end
      end
      result
    end
  end
end
