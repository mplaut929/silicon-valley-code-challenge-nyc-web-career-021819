class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |vc|
      if vc.total_worth > 1000000000
        vc.total_worth
      end
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |fr|
      fr.venture_capitalist ==self
    end
  end

  def portfolio
    self.funding_rounds.map do |fr|
      fr.startup
    end.uniq
  end

  def biggest_investment
    self.funding_rounds.max_by{|fr| fr.investment}
  end

  def invested(domain)
    total = 0
    self.funding_rounds.map do |fr|
      if fr.startup.domain == domain
        total += fr.investment
      end
    end
    total
  end


end
