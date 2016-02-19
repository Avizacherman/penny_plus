json.users @users.each do |user|
  json.full_name user.full_name
  json.score user.scoreboard.score
end
