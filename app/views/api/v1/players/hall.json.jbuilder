json.array @players do |player|
  json.extract! player, :id,:nickname, :avatar, :ranking, :status
end
