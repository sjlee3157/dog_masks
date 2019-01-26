# Example for Shruti

table_usd = [ [ {name: "NAME"}, {tuition_usd: 1000}, {email: "EMAIL"}
          ] ,
          [ {name: "NAME"}, {tuition_usd: 1000}, {email: "EMAIL"}
          ] ,
          [ {name: "NAME"}, {tuition_usd: 1000}, {email: "EMAIL"}
          ] ,
        ]

# table_jpy = []
#
# table_usd.each do |student|
#   table_jpy << student
# end
#
# p table_usd
# p table_jpy

table_jpy = table_usd.map {|a| a[1] = {tuition_jpy: (a[1][:tuition_usd]*2)}}

p table_usd
p table_jpy
