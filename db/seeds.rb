require 'net/http'

u = User.create email: 'admin@admin.com', password: '12345678'
u.add_role :admin


Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

# http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
# estados = JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
#
# estados.each do |estado|
#   estado_obj = State.create(name: estado["name"], acronym: estado["acronym"], ibge: estado["code"])
#   estado_obj.save
#
#   estado["cities"].each do |cidade|
#     City.create(name: cidade["name"], state: estado_obj, ibge: cidade["code"])
#   end
# end

# City.where(latitude: nil).each{|c| coord=Geocoder.search("#{c.name}, #{c.state.name}, Brasil")&.first&.coordinates; c.latitude=coord[0] if coord; c.longitude=coord[1] if coord; c.save;}
