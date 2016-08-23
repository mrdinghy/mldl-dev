



thisstructure = 7
montharray = [1,2,3,4,5,6,7,8]
meetingsmonth = [1,2,3]

montharray.each { |m|



  meeting1 = Meeting.create(name: 'weekly meeting', location: 'Meeting House', real_start: DateTime.new(2016,m,rand(1..30),9,0,0), structure_id: thisstructure)
  Meeting.update(meeting1, real_end: meeting1.real_start + 1.hours)

randx = rand(20..60)
issuearray=[1..randx]

  issuearray.each { |i|

  newissue=Issue.create(
  name: 'Test Issue lice presence in Wee-Gbeyi District',
  description: 'Mob violence in Wee-Gbeyi district over the past few years, Wee-Gbeyi DSC members reported on limited security personnel presence in the district With the history',
  structure_id: thisstructure,
  district_id: rand(12..17),
  scope_id: rand(1..5),
  actionplan: 'Referred to CSC for redress in two months',
  disputant: 'All citizens of Wee-Gbeyi',
  community: 'Test community',
  category_id: rand(1..10),
  old_id: '2015-11-CF-XX-00168',
  actioncommittee: 'DSC leadership')

  }
}





