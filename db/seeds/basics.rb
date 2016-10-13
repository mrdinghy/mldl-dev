
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email



User.create(name: 'Steve Metzger', email: 'stvmetzger@aol.com', password: 'cantina23', mldlrole: 1 )
User.create(name: 'Steve Snyder', email: 'ssnyder@thekaizencompany.com', password: 'snyderMLDL123', mldlrole: 1)
User.create(name: 'Breana Timlin', email: 'btimlin@thekaizencompany.com', password: 'timlinMLDL123', mldlrole: 1)
User.create(name: 'Meagan Ohmart', email: 'mohmart@thekaizencompany.com', password: 'ohartMLDL123', mldlrole: 1)
User.create(name: 'Ryan Thomas', email: 'ryan.thomas.rt@gmail.com', password: 'thomasMLDL123', mldlrole: 1)
User.create(name: 'Voinjama Manager', email: 'voinjama_mgr@mldl.org', password: 'voinjama1234', mldlrole: 2)
User.create(name: 'Amy Schmisseur', email: 'SchmisseurAL@state.gov', password: 'schmisseurMLDL1234', mldlrole: 2)
User.create(name: 'Meg Mahoney', email: 'MahoneyMM@state.gov', password: 'mahoneyMLDL1234', mldlrole: 2)
User.create(name: 'Jon Paul Martinez', email: 'MartinezJP2@state.gov', password: 'martinezMLDL1234', mldlrole: 2)
User.create(name: 'Heather Harms', email: 'HarmsHL@state.gov', password: 'harmsMLDL1234', mldlrole: 2)
User.create(name: 'Isaiah D. Kannah', email: 'ikannah@mldlliberia.com', password: 'kannahMLDL1234', mldlrole: 2)
User.create(name: 'Roselyn Mulbah', email: 'rmulbah@mldl-liberia.com', password: 'mulbahMLDL1234', mldlrole: 2)
User.create(name: 'Jonathan Roberts', email: 'jroberts@mldl-liberia.com', password: 'robertsMLDL1234', mldlrole: 2)
User.create(name: 'David Lamah', email: 'dlamah@mldl-liberia.com', password: 'lamahMLDL1234', mldlrole: 2)
User.create(name: 'Thomas Suah', email: 'tsuah@mldl-liberia.com', password: 'suahMLDL1234', mldlrole: 2)
User.create(name: 'Martins Sopp', email: 'msopp@mldl-liberia.com', password: 'soppMLDL1234', mldlrole: 2)
User.create(name: 'Marti Troy', email: 'mtroy@mldl-liberia.com', password: 'troyMLDL1234', mldlrole: 2)
User.create(name: 'Joseph Boimah', email: 'jboimah@mldl-liberia.com', password: 'boimahMLDL1234', mldlrole: 2)
User.create(name: 'James Kollie', email: 'jkollie@mldl-liberia.com', password: 'kollieMLDL1234', mldlrole: 2)
User.create(name: 'Global Fellow', email: 'globalfellow@mldl-liberia.com', password: 'fellowMLDL1234', mldlrole: 2)



Scope.create ([
                 {name: "Short-term Issue"},
                 {name: "Long-term Issue"},
                 {name: "Ongoing Violence"},
                 {name: "Threat of Violence"},
                 {name: "Security Concern"}
             ])




Resolutiontype.create ([
                 {name: "Resolved by Structure"},
                 {name: "Resolved by the community"},
                 {name: "Resolved with MLDL support"},
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






Structure.create(short: 'NS', name: 'National Security Council', structuretype: Structuretype::NSC)

# BOMI

c = County.create(name: 'Bomi')

d = District.create(name: 'Dewoin', county_id: c.id)
d = District.create(name: 'Klay', county_id: c.id)
d = District.create(name: 'Mecca', county_id: c.id)
d = District.create(name: 'Senjeh', county_id: c.id)

c = County.create(name: 'Bong')
sc = Structure.create(short: 'CS-BO', name: 'Bong CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Fuamah', county_id: c.id)
d = District.create(name: 'Kokoyah', county_id: c.id)

d = District.create(name: 'Kpai (Panta-Kpa)', county_id: c.id)
sd = Structure.create(short: 'DS-KP', name: 'Kpaai DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Zoewienta CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-KP', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Suakoko', county_id: c.id)
sd = Structure.create(short: 'DS-SU', name: 'Suakoko DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Sinyea CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-SU', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Salala', county_id: c.id)
d = District.create(name: 'Sanayea', county_id: c.id)
d = District.create(name: 'Zota', county_id: c.id)

# Gbarpolu






c = County.create(name: 'Lofa')
sc = Structure.create(short: 'CS-LO', name: 'Lofa CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Foya', county_id: c.id)
sd = Structure.create(short: 'DS-FO', name: 'Foya DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Shelloe CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-FO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Kolahun', county_id: c.id)
d = District.create(name: 'Salayea', county_id: c.id)
d = District.create(name: 'Vahun', county_id: c.id)

d = District.create(name: 'Voinjama', county_id: c.id)
sd = Structure.create(short: 'DS-VJ', name: 'Voinjama DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Vezella CF, Kolliemai CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-VJ', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end



d = District.create(name: 'Zorzor', county_id: c.id)
sd = Structure.create(short: 'DS-ZO', name: 'Zorzor DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Konia CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-ZO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end





c = County.create(name: 'Nimba')
sc = Structure.create(short: 'CS-NI', name: 'Nimba CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Gbehlay-Geh', county_id: c.id)
sd = Structure.create(short: 'DS-GL', name: 'Gbehlay-Geh DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Garplay CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-GL', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end




d = District.create(name: 'Buu-Yao', county_id: c.id)
sd = Structure.create(short: 'DS-BY', name: 'Buu-Yao DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Gblourlay CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-BY', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Wee-Gbehyi-Mahn', county_id: c.id)
sd = Structure.create(short: 'DS-WG', name: 'Wee-Gbeyi DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Fleedin']
communities.each do |x|
  scl = Structure.create(short: 'CF-WG', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Kpariblee', county_id: c.id)
sd = Structure.create(short: 'DS=KB', name: 'Kpaiblee DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Dubuzon CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-KB', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Garr-Bain', county_id: c.id)
sd = Structure.create(short: 'DS-GB', name: 'Garr-Bain DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Ganta CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-GB', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Yarmein', county_id: c.id)
sd = Structure.create(short: 'DS-YM', name: 'Yarmein DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Bonlah CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-YM', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end

d = District.create(name: 'Saclepea District', county_id: c.id)
d = District.create(name: 'Sanniquelleh-Mahn District', county_id: c.id)
d = District.create(name: 'Tappita District', county_id: c.id)
d = District.create(name: 'Yarwein-Mehnsohnneh District', county_id: c.id)
d = District.create(name: 'Zoegeh District', county_id: c.id)

c = County.create(name: 'Grand Gedeh')
sc = Structure.create(short: 'CS-GG', name: 'Grand Gedeh CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1)

d = District.create(name: 'Bhai', county_id: c.id)
sd = Structure.create(short: 'DS-BH', name: 'Bhai DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Sennehwen CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-BH', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


d = District.create(name: 'Gbao', county_id: c.id)
sd = Structure.create(short: 'DS-GO', name: 'Gbao DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Polar CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-GO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end
d = District.create(name: 'Konobo', county_id: c.id)
sd = Structure.create(short: 'DS-KO', name: 'Konobo DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id)
communities = ['Ziah CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-KO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id)
end


Membership.create(structure_id:2, person_id: 1)

