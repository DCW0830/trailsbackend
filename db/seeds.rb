User.destroy_all
Trail.destroy_all
UserTrail.destroy_all

User.create(username: 'Tammy')
User.create(username: 'Mathew')
User.create(username: 'Daniel')

Trail.create(trail_number: 4573)
Trail.create(trail_number: 2090)
Trail.create(trail_number: 1742)
Trail.create(trail_number: 5798)

UserTrail.create(user_id: 1, trail_id: 1)
UserTrail.create(user_id: 1, trail_id: 2)
UserTrail.create(user_id: 2, trail_id: 1)
UserTrail.create(user_id: 2, trail_id: 2)
UserTrail.create(user_id: 2, trail_id: 3)
UserTrail.create(user_id: 2, trail_id: 4)
UserTrail.create(user_id: 3, trail_id: 3)
UserTrail.create(user_id: 3, trail_id: 4)
