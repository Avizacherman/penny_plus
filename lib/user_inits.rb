module UserInits
  def initialize_geodatum
    self.build_geodatum({lat: 0, lng: 0})
  end

  def initialize_score
    self.build_scoreboard({score: 0, total_payout: 0.00})
  end

end
