
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
User.create(name: 'Isaiah D. Kannah', email: 'ikannah@mldl-liberia.com', password: 'kannahMLDL1234', mldlrole: 2)
User.create(name: 'Roselyn Mulbah', email: 'rmulbah@mldl-liberia.com', password: 'mulbahMLDL1234', mldlrole: 2)
User.create(name: 'Jonathan Roberts', email: 'jroberts@mldl-liberia.com', password: 'robertsMLDL1234', mldlrole: 2)
User.create(name: 'David Lamah', email: 'dlamah@mldl-liberia.com', password: 'lamahMLDL1234', mldlrole: 2)
User.create(name: 'Thomas Suah', email: 'tsuah@mldl-liberia.com', password: 'suahMLDL1234', mldlrole: 2)
User.create(name: 'Martins Sopp', email: 'msopp@mldl-liberia.com', password: 'soppMLDL1234', mldlrole: 2)
User.create(name: 'Marti Troy', email: 'mtroy@mldl-liberia.com', password: 'troyMLDL1234', mldlrole: 2)
User.create(name: 'Joseph Boimah', email: 'jboimah@mldl-liberia.com', password: 'boimahMLDL1234', mldlrole: 2)
User.create(name: 'James Kollie', email: 'jkollie@mldl-liberia.com', password: 'kollieMLDL1234', mldlrole: 2)
User.create(name: 'Global Fellow', email: 'globalfellow@mldl-liberia.com', password: 'fellowMLDL1234', mldlrole: 2)
User.create(name: 'sysadmin', email: 'sysadmin@mldl-liberia.com', password: 'sysadminMLDL1234', mldlrole: 2)
User.create(name: 'Sam Dakana', email: 'sdakana@mldl-liberia.com', password: 'dakanaMLDL1234', mldlrole: 2)
User.create(name: 'Doegbazee Zaza', email: 'dzaza@mldl-liberia.com', password: 'zazaMLDL1234', mldlrole: 2)
User.create(name: 'Sam Danaka', email: 'sfdanaka@yahoo.com', password: 'danakaMLDL1234', mldlrole: 2)

User.create(name: 'Rachel Sampson', email: 'xsampson@mldl-liberia.com', password: 'nopassword1', mldlrole: 2)
User.create(name: 'Sam Worloh', email: 'xworloh@ymldl-liberia.com', password: 'nopassword2', mldlrole: 2)
User.create(name: 'Abbas Mahvash', email: 'xmahvash@mldl-liberia.com', password: 'nopassword3', mldlrole: 2)




Project.create(name: 'MLDL2')

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



Quarter.create([
                   {qtryear: 2013, qtrqtr: 1, qtrmonth: 1},
                   {qtryear: 2013, qtrqtr: 2, qtrmonth: 4},
                   {qtryear: 2013, qtrqtr: 3, qtrmonth: 7},
                   {qtryear: 2013, qtrqtr: 4, qtrmonth: 10},
                   {qtryear: 2014, qtrqtr: 1, qtrmonth: 1},
                   {qtryear: 2014, qtrqtr: 2, qtrmonth: 4},
                   {qtryear: 2014, qtrqtr: 3, qtrmonth: 7},
                   {qtryear: 2014, qtrqtr: 4, qtrmonth: 10},
                   {qtryear: 2015, qtrqtr: 1, qtrmonth: 1},
                   {qtryear: 2015, qtrqtr: 2, qtrmonth: 4},
                   {qtryear: 2015, qtrqtr: 3, qtrmonth: 7},
                   {qtryear: 2015, qtrqtr: 4, qtrmonth: 10},
                   {qtryear: 2016, qtrqtr: 1, qtrmonth: 1},
                   {qtryear: 2016, qtrqtr: 2, qtrmonth: 4},
                   {qtryear: 2016, qtrqtr: 3, qtrmonth: 7},
                   {qtryear: 2016, qtrqtr: 4, qtrmonth: 10}




               ])


Structure.create(short: 'NS', name: 'National Security Council', structuretype: Structuretype::NSC, project_id: 1)

# BOMI

c = County.create(name: 'Bomi')

d = District.create(name: 'Dewoin', county_id: c.id)
d = District.create(name: 'Klay', county_id: c.id)
d = District.create(name: 'Mecca', county_id: c.id)
d = District.create(name: 'Senjeh', county_id: c.id)

c = County.create(name: 'Bong')
sc = Structure.create(short: 'CS-BO', name: 'Bong CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1, project_id: 1)

d = District.create(name: 'Fuamah', county_id: c.id)
d = District.create(name: 'Kokoyah', county_id: c.id)

d = District.create(name: 'Kpai (Panta-Kpa)', county_id: c.id)
sd = Structure.create(short: 'DS-KP', name: 'Kpaai DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Zoewienta CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-KP', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end







d = District.create(name: 'Suakoko', county_id: c.id)
sd = Structure.create(short: 'DS-SU', name: 'Suakoko DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Sinyea CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-SU', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end


d = District.create(name: 'Salala', county_id: c.id)
d = District.create(name: 'Sanayea', county_id: c.id)
d = District.create(name: 'Zota', county_id: c.id)
d = District.create(name: 'Jorquelleh', county_id: c.id)


# Gbarpolu
c = County.create(name: 'Gbarpolu')
d = District.create(name: 'Belleh', county_id: c.id)
d = District.create(name: 'Bokomu', county_id: c.id)
d = District.create(name: 'Bopolu', county_id: c.id)
d = District.create(name: 'Gbarma', county_id: c.id)
d = District.create(name: 'Kongba', county_id: c.id)


# Grand Bassa
c = County.create(name: 'Grand Bassa')
d = District.create(name: 'District #1', county_id: c.id)
d = District.create(name: 'District #2', county_id: c.id)
d = District.create(name: 'District #3', county_id: c.id)
d = District.create(name: 'District #4', county_id: c.id)
d = District.create(name: 'Owensgrove', county_id: c.id)
d = District.create(name: 'St. John River', county_id: c.id)

# Grand Cape
c = County.create(name: 'Grand Cape Mount')
d = District.create(name: 'Commonwealth', county_id: c.id)
d = District.create(name: 'Garwula', county_id: c.id)
d = District.create(name: 'Gola Konneh', county_id: c.id)
d = District.create(name: 'Porkpa', county_id: c.id)
d = District.create(name: 'Tewor', county_id: c.id)


# Grand Kru
c = County.create(name: 'Grand Kru')
d = District.create(name: 'Buah', county_id: c.id)
d = District.create(name: 'Lower Kru Coast', county_id: c.id)
d = District.create(name: 'Sasstown', county_id: c.id)
d = District.create(name: 'Upper Kru Coast', county_id: c.id)



c = County.create(name: 'Lofa')
sc = Structure.create(short: 'CS-LO', name: 'Lofa CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1, project_id: 1)

d = District.create(name: 'Foya', county_id: c.id)
sd = Structure.create(short: 'DS-FO', name: 'Foya DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Shelloe CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-FO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end

d = District.create(name: 'Kolahun', county_id: c.id)
d = District.create(name: 'Salayea', county_id: c.id)
d = District.create(name: 'Vahun', county_id: c.id)
d = District.create(name: 'Quardu Gboni', county_id: c.id)

d = District.create(name: 'Voinjama', county_id: c.id)
sd = Structure.create(short: 'DS-VJ', name: 'Voinjama DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Vezella CF, Kolliemai CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-VJ', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end



d = District.create(name: 'Zorzor', county_id: c.id)
sd = Structure.create(short: 'DS-ZO', name: 'Zorzor DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Konia CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-ZO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end


c = County.create(name: 'Margibi')
d = District.create(name: 'Firestone', county_id: c.id)
d = District.create(name: 'Gibi', county_id: c.id)
d = District.create(name: 'Karkata', county_id: c.id)
d = District.create(name: 'Mambah-Kaba', county_id: c.id)


c = County.create(name: 'Maryland')
d = District.create(name: 'Barrobo', county_id: c.id)
d = District.create(name: 'Pleebo/Sodeken', county_id: c.id)

c = County.create(name: 'Montserrado')
d = District.create(name: 'Careysburg', county_id: c.id)
d = District.create(name: 'Greater Monrovia', county_id: c.id)
d = District.create(name: 'St. Paul River', county_id: c.id)
d = District.create(name: 'Todee', county_id: c.id)


c = County.create(name: 'Nimba')
sc = Structure.create(short: 'CS-NI', name: 'Nimba CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1, project_id: 1)

d = District.create(name: 'Gbehlay-Geh', county_id: c.id)
sd = Structure.create(short: 'DS-GL', name: 'Gbehlay-Geh DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Garplay CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-GL', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end

d = District.create(name: 'Buu-Yao', county_id: c.id)
sd = Structure.create(short: 'DS-BY', name: 'Buu-Yao DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Gblourlay CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-BY', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end


d = District.create(name: 'Wee-Gbehyi-Mahn', county_id: c.id)
sd = Structure.create(short: 'DS-WG', name: 'Wee-Gbeyi DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Fleedin']
communities.each do |x|
  scl = Structure.create(short: 'CF-WG', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end

d = District.create(name: 'Kpariblee', county_id: c.id)
sd = Structure.create(short: 'DS=KB', name: 'Kpaiblee DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Dubuzon CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-KB', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end


d = District.create(name: 'Garr-Bain', county_id: c.id)
sd = Structure.create(short: 'DS-GB', name: 'Garr-Bain DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Ganta CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-GB', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end

d = District.create(name: 'Yarmein', county_id: c.id)
sd = Structure.create(short: 'DS-YM', name: 'Yarmein DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Bonlah CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-YM', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end
d = District.create(name: 'Yarmein-Mehnsohnneh', county_id: c.id)
d = District.create(name: 'Saclepea', county_id: c.id)
d = District.create(name: 'Sanniquelleh-Mahn', county_id: c.id)
d = District.create(name: 'Tappita', county_id: c.id)
d = District.create(name: 'Zoegeh', county_id: c.id)
d = District.create(name: 'Leewehpea-Mahn', county_id: c.id)
d = District.create(name: 'Yarpea Mahn', county_id: c.id)

c = County.create(name: 'Grand Gedeh')
sc = Structure.create(short: 'CS-GG', name: 'Grand Gedeh CSC', structuretype: Structuretype::CSC, county_id: c.id, parent_id: 1, project_id: 1)

d = District.create(name: 'Bhai', county_id: c.id)
sd = Structure.create(short: 'DS-BH', name: 'Bhai DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Sennehwen CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-BH', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end


d = District.create(name: 'Gbao', county_id: c.id)
sd = Structure.create(short: 'DS-GO', name: 'Gbao DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Polar CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-GO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end
d = District.create(name: 'Konobo', county_id: c.id)
sd = Structure.create(short: 'DS-KO', name: 'Konobo DSC', structuretype: Structuretype::DSC, county_id: c.id, district_id: d.id, parent_id: sc.id, project_id: 1)
communities = ['Ziah CF']
communities.each do |x|
  scl = Structure.create(short: 'CF-KO', name: x, structuretype: Structuretype::CF, county_id: c.id, district_id: d.id, parent_id: sd.id, project_id: 1)
end
d = District.create(name: 'Tchien', county_id: c.id)
d = District.create(name: 'Gbarzon', county_id: c.id)



c = County.create(name: 'Sinoe')
d = District.create(name: 'Butaw', county_id: c.id)
d = District.create(name: 'Dugbe River', county_id: c.id)
d = District.create(name: 'Greenville', county_id: c.id)
d = District.create(name: 'Jaedae Jaedepo', county_id: c.id)
d = District.create(name: 'Juarzon', county_id: c.id)
d = District.create(name: 'Kpayan', county_id: c.id)
d = District.create(name: 'Pyneston', county_id: c.id)


managers = Manager.create([
{structure_id: 1, user_id: 23},
{structure_id: 2, user_id: 14},
{structure_id: 3, user_id: 14},
{structure_id: 4, user_id: 14},
{structure_id: 5, user_id: 14},
{structure_id: 6, user_id: 14},
{structure_id: 7, user_id: 20},
{structure_id: 8, user_id: 20},
{structure_id: 9, user_id: 20},
{structure_id: 10, user_id: 20},
{structure_id: 11, user_id: 20},
{structure_id: 12, user_id: 20},
{structure_id: 13, user_id: 20},
{structure_id: 14, user_id: 16},
{structure_id: 15, user_id: 16},
{structure_id: 16, user_id: 16},
{structure_id: 17, user_id: 16},
{structure_id: 18, user_id: 16},
{structure_id: 19, user_id: 16},
{structure_id: 20, user_id: 16},
{structure_id: 21, user_id: 16},
{structure_id: 22, user_id: 16},
{structure_id: 23, user_id: 16},
{structure_id: 24, user_id: 16},
{structure_id: 25, user_id: 16},
{structure_id: 26, user_id: 16},
{structure_id: 27, user_id: 12},
{structure_id: 28, user_id: 12},
{structure_id: 29, user_id: 12},
{structure_id: 30, user_id: 12},
{structure_id: 31, user_id: 12},
{structure_id: 32, user_id: 12},
{structure_id: 33, user_id: 12}

])





















Membership.create(structure_id:2, person_id: 1)

Metric.create([
{name: 'Cumulative Issues', code:'qissues', objectmodel: 1},
{name: 'New Issues During Qtr', code:'qissues_new', objectmodel: 1},
{name: 'Begin Qtr Open Issues', code:'qissues_begin', objectmodel: 1},
{name: 'Issues Resolved in Qtr', code:'qissues_resolved', objectmodel: 1},
{name: 'Meetings in Qtr', code:'qmeetings', objectmodel: 2},
{name: 'Agendas on Meetings', code:'qagendas', objectmodel: 3},
{name: 'Agenda Result: Resolved', code:'aresult_resolved', objectmodel: 3},
{name: 'Agenda Result: Mediation', code:'aresult_mediation', objectmodel: 3},
{name: 'Agenda Result: Referral', code:'aresult_escalated', objectmodel: 3},
{name: 'Agenda Result: Cancelled', code:'aresult_cancelled', objectmodel: 3},
{name: 'Agenda Result: Ongoing', code:'aresult_ongoing', objectmodel: 3},
{name: 'Mediations Started', code:'qmediation_start', objectmodel: 4},
{name: 'Mediations Ended', code:'qmediation_end', objectmodel: 4},
{name: 'Mediation Result: Resolved', code:'mresult_resolved', objectmodel: 4},
{name: 'Mediation Result: Referral', code:'mresult_escalated', objectmodel: 4},
{name: 'Mediation Result: Cancelled', code:'mresult_cancelled', objectmodel: 4},
{name: 'Mediation Result: Ongoing', code:'mresult_ongoing', objectmodel: 4}

              ])



CategoryColor.create([
{name: "#7e3838"},
{name: "#7e6538"},
{name: "#7c7e38"},
{name: "#587e38"},
{name: "#387e45"},
{name: "#387e6a"},
{name: "#386a7e"},
{name: "#38507e"},
{name: "#4d387e"},
{name: "#7a387e"}
                     ])







