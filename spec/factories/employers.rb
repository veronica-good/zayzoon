FactoryBot.define do
  factory :employer do
    name{"Abcd"}
    password{"supersecret"}
    fields{'''{
      "emp": {"field": "external_ref", "type": "string"},
      "date": {"field": "earning_date", "type": "date", "format": "%Y-%m-%d"},
      "amount": {"field": "amount, "type": "decimal"} 
    }'''}
  end
end
