# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# CSV.load (path name) do |row!

#   code = row[0]
#   rvu = row[1]
#   description = row[2]

# Procedure.create(code: code, work_rvu: rvyue)

# end

file_name = File.read('db/lib/work_rvu.csv')
csv = CSV.parse(file_name, headers: true)
csv.each do |row|

  unless row['description'] == nil || row['wrvu'] == '0.00'
    code = row[0]
    description = row[2]
    wrvu = row[5].to_f

    Procedure.create!(code: code, description: description, work_rvu: wrvu)
  end
end
