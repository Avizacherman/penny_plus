@users.each do |user|
  json.full_name user.full_name
  json.score user.score_board.score
end
