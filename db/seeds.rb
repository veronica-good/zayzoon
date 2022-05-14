# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Employee.delete_all
Employer.delete_all



employer1 = Employer.create(
  name: "AcmeCo",
  password: "supersecret",
  fields: '''{
    "EmployeeNumber": {"field": "external_ref", "type": "string"},
    "CheckDate": {"field": "earning_date", "type": "date", "format": "%m/%d/%Y"},
    "Amount": {"field": "amount", "type": "decimal", "regexp": "\\$(\\d+\\.?\\d*)"}
  }'''
)

Employee.create(
  employer_id: employer1.id,
  name: "Veronica",
  external_ref: "A123"
)

Employee.create(
  employer_id: employer1.id,
  name: "Nica",
  external_ref: "B456"
)

employer2 = Employer.create(
  name: "BetaCo",
  password: "supersecret1",
  fields: '''{
    "employee": {"field": "external_ref", "type": "string"},
    "earningDate": { "field": "earning_date", "type": "date", "format": "%Y-%m-%d"},
    "netAmount": {"field": "amount", "type": "decimal"}
  }'''
)

employer2.employees.create(
  name: "Jordan",
  external_ref: "123"
)

employer2.employees.create(
  name: "Daniel",
  external_ref: "456"
)
