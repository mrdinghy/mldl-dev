
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email



User.create(email: 'stvmetzger@aol.com', password: 'cantina23')
User.create(email: 'ssnyder@thekaizencompany.com', password: 'snyderMLDL123', name: 'Steve Snyder')
User.create(email: 'btimlin@thekaizencompany.com', password: 'timlinMLDL123')
User.create(email: 'mohmart@thekaizencompany.com', password: 'ohartMLDL123')
User.create(email: 'ryan.thomas.rt@gmail.com', password: 'thomasMLDL123')
User.create(email: 'voinjama_mgr@mldl.org', password: 'voinjama1234')
User.create(email: 'voinjama_adm@mldl.org', password: 'voinjama1234')

Userrole.create(user_id: 1, role_id: 3)
Userrole.create(user_id: 2, role_id: 3)
Userrole.create(user_id: 3, role_id: 3)
Userrole.create(user_id: 4, role_id: 3)
Userrole.create(user_id: 5, role_id: 3)
Userrole.create(user_id: 6, role_id: 1)
Userrole.create(user_id: 7, role_id: 2)

Assignment.create(userrole_id: 4, structure_id: 10)
Assignment.create(userrole_id: 3, structure_id: 10)


Role.create(name: 'Structure Admin')
Role.create(name: 'Structure Manager')
Role.create(name: 'System Admin')
Role.create(name: 'System Manager')
Role.create(name: 'View Only')




Structuretype.create([
                         {name: "Community Forum", code: "CF"},
                         {name: "District Security Council", code: "DSC"},
                         {name: "County Security Council", code: "CSC"},
                         {name: "National Security Council", code: "NSC"}
                     ])



Status.create([
                  {name: "Open"},
                  {name: "Resolved"},
                  {name: "On Hold"},
                  {name: "Cancelled"}
              ])

Scope.create ([
                 {name: "Short-term Issue"},
                 {name: "Long-term Issue"},
                 {name: "Ongoing Violence"},
                 {name: "Threat of Violence"},
                 {name: "Security Concern"}
             ])



Category.create([
                    {name: "General Land"},
                    {name: "International Border"},
                    {name: "Internal Border"},
                    {name: "Violence"},
                    {name: "Government Corruption"},
                    {name: "Infrastructure"},
                    {name: "Security Services"},
                    {name: "Public Health & Safety"},
                    {name: "Traditional Community"},
                    {name: "Other"}
                ])






Structure.create(name: 'National Security Council', structuretype_id: 4)

# BOMI

c = County.create(name: 'Bomi')

d = District.create(name: 'Dewoin', county_id: c.id)
d = District.create(name: 'Klay District', county_id: c.id)
d = District.create(name: 'Mecca District', county_id: c.id)
d = District.create(name: 'Senjeh District', county_id: c.id)

c = County.create(name: 'Bong')
sc = Structure.create(name: 'Bong CSC', structuretype_id: 3, county_id: c.id)

d = District.create(name: 'Fuamah', county_id: c.id)
d = District.create(name: 'Kokoyah District', county_id: c.id)

d = District.create(name: 'Kpai (Panta-Kpa)', county_id: c.id)
sd = Structure.create(name: 'Kpaai DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Zoewienta']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Suakoko', county_id: c.id)
sd = Structure.create(name: 'Suakoko DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Sinyea CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Salala District', county_id: c.id)
d = District.create(name: 'Sanayea District', county_id: c.id)
d = District.create(name: 'Zota District', county_id: c.id)

# Gbarpolu






c = County.create(name: 'Lofa County')
sc = Structure.create(name: 'Lofa CSC', structuretype_id: 3, county_id: c.id)

d = District.create(name: 'Foya District', county_id: c.id)
sd = Structure.create(name: 'Foya DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Shelloe']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Kolahun District', county_id: c.id)
d = District.create(name: 'Salayea District', county_id: c.id)
d = District.create(name: 'Vahun District', county_id: c.id)

d = District.create(name: 'Voinjama District', county_id: c.id)
sd = Structure.create(name: 'Voinjama DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Vezella CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end



d = District.create(name: 'Zorzor District', county_id: c.id)
sd = Structure.create(name: 'Zorzor DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Konia CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end





c = County.create(name: 'Nimba County')
sc = Structure.create(name: 'Nimba CSC', structuretype_id: 3, county_id: c.id)

d = District.create(name: 'Gbehlay-Geh District', county_id: c.id)
sd = Structure.create(name: 'Gbehlay-Geh DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Garplay CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end




d = District.create(name: 'Buu-Yao', county_id: c.id)
sd = Structure.create(name: 'Buu-Yao DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Gblourlay CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Wee-Gbehyi-Mahn', county_id: c.id)
sd = Structure.create(name: 'Wee-Gbeyi DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Fleedin']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Kpariblee', county_id: c.id)
sd = Structure.create(name: 'Kpaiblee DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Dubuzon CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Garr-Bain', county_id: c.id)
sd = Structure.create(name: 'Garr-Bain DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Ganta CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Yarmein', county_id: c.id)
sd = Structure.create(name: 'Yarmein DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Bonlah CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype_id: 1, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Saclepea District', county_id: c.id)
d = District.create(name: 'Sanniquelleh-Mahn District', county_id: c.id)
d = District.create(name: 'Tappita District', county_id: c.id)
d = District.create(name: 'Yarwein-Mehnsohnneh District', county_id: c.id)
d = District.create(name: 'Zoegeh District', county_id: c.id)

c = County.create(name: 'Grand Gedeh')
sc = Structure.create(name: 'Grand Gedeh CSC', structuretype_id: 3, county_id: c.id)

d = District.create(name: 'Bhai', county_id: c.id)
sd = Structure.create(name: 'Bhai DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)

d = District.create(name: 'Gbao', county_id: c.id)
sd = Structure.create(name: 'Gbao DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)

d = District.create(name: 'Konobo', county_id: c.id)
sd = Structure.create(name: 'Konobo DSC', structuretype_id: 2, county_id: c.id, district_id: d.id, parent_id: sc.id)



Membership.create(structure_id:2, person_id: 1)


Actiontype.create([
                      {name: 'Created'},
                      {name: 'Add to Meeting'},
                      {name: 'Add Comment'},
                      {name: 'Report from Meeting'},
                      {name: 'Change Ownership'},
                      {name: 'Mediation Report'},
                      {name: 'Resolution'},
                      {name: 'Place on Hold'},
                      {name: 'Cancel'},
                      {name: 'Reopened'}
                  ])




