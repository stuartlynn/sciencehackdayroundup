# gem install google-spreadsheet-ruby 

require 'rubygems'
require 'net/http'
require 'uri'
require 'google_spreadsheet'
require 'erb'

# CHANGE THIS LINE TO YOUR GMAIL LOGIN DETAILS:
session = GoogleSpreadsheet.login("stuart@zooniverse.org","burningm0nkey")
rows = session.spreadsheet_by_url("https://spreadsheets.google.com/feeds/worksheets/0AqCCIkeViZNwdERjeGVYV1VTVkNRUV90RndwRDA3aUE/private/full").worksheets[0].rows
fields = rows[0]
data = rows.slice(1,rows.size).map { |row| data={} ; fields.zip(row).each { |f,r| data[f] = r } ; data }
puts "defigning template ",data


template = ERB.new <<-EOF
  module.exports=
    name : "<%=row['Hack Name'] %>"
    creators: " <%=row['Creators']%> "
    about: "<%=row['About the hack'].gsub(/\n/,"<br />")%>"
    resources: "<%=row['What APIs, data, tools, hardware or kit did you use?']%>"
    media: "<%=row['Screenshots, photos, audio or video of your hack']%>"
    url : "<%=row['Hack URL']%>"
    sourceCode: "<%=row['Source code and links']%>"
EOF

puts "defigning template"
data.each_with_index do |row, idx|
  File.open("#{row['Hack Name']}.coffee" ,"w") {|f| f.puts template.result(binding) }
end
