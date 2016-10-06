
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email



User.create(name: 'Steve Metzger', email: 'stvmetzger@aol.com', password: 'cantina23')
User.create(name: 'Steve Snyder', email: 'ssnyder@thekaizencompany.com', password: 'snyderMLDL123')
User.create(name: 'Breana Timlin', email: 'btimlin@thekaizencompany.com', password: 'timlinMLDL123')
User.create(name: 'Meagan Ohmart', email: 'mohmart@thekaizencompany.com', password: 'ohartMLDL123')
User.create(name: 'Ryan Thomas', email: 'ryan.thomas.rt@gmail.com', password: 'thomasMLDL123')
User.create(name: 'Voinjama Manager', email: 'voinjama_mgr@mldl.org', password: 'voinjama1234')
User.create(name: 'Voinjama Admin', email: 'voinjama_adm@mldl.org', password: 'voinjama1234')

Userrole.create(user_id: 1, role_id: 3)
Userrole.create(user_id: 2, role_id: 3)
Userrole.create(user_id: 3, role_id: 3)
Userrole.create(user_id: 4, role_id: 3)
Userrole.create(user_id: 5, role_id: 3)
Userrole.create(user_id: 6, role_id: 1)
Userrole.create(user_id: 7, role_id: 2)

Assignment.create(userrole_id: 4, structure_id: 10)
Assignment.create(userrole_id: 3, structure_id: 10)


Role.create(name: 'Structure Manager')

perms = Permission.create([
{name: 'Structure-Create Issue'},
{name: 'Structure-Create Meeting'},
{name: 'Structure-Edit'},
{name: 'Structure-Add Memebers'},
{name: 'Meeting=Edit Agenda'},
{name: 'Meeting-New Issue'},
{name: 'Meeting-Add Participants'},
{name: 'Meeting-Add Documents'},
{name: 'Issue-Edit'},
{name: 'Issue-Add Comment'},
{name: 'Issue-Add to Agenda'},
{name: 'Issue-Escalate'},
{name: 'Issue-Mediation'},
{name: 'Issue-Resolution'},
{name: 'Issue-Cancel'},
{name: 'Issue-Add Documents'},
{name: 'Issue-Add Disputants'},
{name: 'Medation-Edit'},
{name: 'Mediation-Result'},
{name: 'Mediation-Add Documents'},
{name: 'Mediation-Add Mediators'},
{name: 'People=Add'},
{name: 'People-Edit'},
{name: 'Admin Tasks'}

                          ])

































Scope.create ([
                 {name: "Short-term Issue"},
                 {name: "Long-term Issue"},
                 {name: "Ongoing Violence"},
                 {name: "Threat of Violence"},
                 {name: "Security Concern"}
             ])




Resolutiontype.create ([
                 {name: "Mediated by Structure"},
                 {name: "Mediated by the community"},
                 {name: "Mediated with MLDL support"},
                 {name: "Other"}
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






Structure.create(name: 'National Security Council', structuretype: Structuretype::NSC)

# BOMI

c = County.create(name: 'Bomi')

d = District.create(name: 'Dewoin', county_id: c.id)
d = District.create(name: 'Klay', county_id: c.id)
d = District.create(name: 'Mecca', county_id: c.id)
d = District.create(name: 'Senjeh', county_id: c.id)

c = County.create(name: 'Bong')
sc = Structure.create(name: 'Bong CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Fuamah', county_id: c.id)
d = District.create(name: 'Kokoyah', county_id: c.id)

d = District.create(name: 'Kpai (Panta-Kpa)', county_id: c.id)
sd = Structure.create(name: 'Kpaai DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Zoewienta CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Suakoko', county_id: c.id)
sd = Structure.create(name: 'Suakoko DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Sinyea CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Salala', county_id: c.id)
d = District.create(name: 'Sanayea', county_id: c.id)
d = District.create(name: 'Zota', county_id: c.id)

# Gbarpolu






c = County.create(name: 'Lofa CSC')
sc = Structure.create(name: 'Lofa CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Foya', county_id: c.id)
sd = Structure.create(name: 'Foya DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Shelloe CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Kolahun', county_id: c.id)
d = District.create(name: 'Salayea', county_id: c.id)
d = District.create(name: 'Vahun', county_id: c.id)

d = District.create(name: 'Voinjama', county_id: c.id)
sd = Structure.create(name: 'Voinjama DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Vezella CF, Kolliemai CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end



d = District.create(name: 'Zorzor', county_id: c.id)
sd = Structure.create(name: 'Zorzor DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Konia CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end





c = County.create(name: 'Nimba')
sc = Structure.create(name: 'Nimba CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Gbehlay-Geh', county_id: c.id)
sd = Structure.create(name: 'Gbehlay-Geh DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Garplay CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end




d = District.create(name: 'Buu-Yao', county_id: c.id)
sd = Structure.create(name: 'Buu-Yao DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Gblourlay CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Wee-Gbehyi-Mahn', county_id: c.id)
sd = Structure.create(name: 'Wee-Gbeyi DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Fleedin']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Kpariblee', county_id: c.id)
sd = Structure.create(name: 'Kpaiblee DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Dubuzon CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Garr-Bain', county_id: c.id)
sd = Structure.create(name: 'Garr-Bain DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Ganta CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Yarmein', county_id: c.id)
sd = Structure.create(name: 'Yarmein DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Bonlah CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Saclepea District', county_id: c.id)
d = District.create(name: 'Sanniquelleh-Mahn District', county_id: c.id)
d = District.create(name: 'Tappita District', county_id: c.id)
d = District.create(name: 'Yarwein-Mehnsohnneh District', county_id: c.id)
d = District.create(name: 'Zoegeh District', county_id: c.id)

c = County.create(name: 'Grand Gedeh')
sc = Structure.create(name: 'Grand Gedeh CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Bhai', county_id: c.id)
sd = Structure.create(name: 'Bhai DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Sennehwen CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Gbao', county_id: c.id)
sd = Structure.create(name: 'Gbao DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Polar CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end
d = District.create(name: 'Konobo', county_id: c.id)
sd = Structure.create(name: 'Konobo DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Ziah CF']
communities.each do |x|
  scl = Structure.create(name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


Membership.create(structure_id:2, person_id: 1)

