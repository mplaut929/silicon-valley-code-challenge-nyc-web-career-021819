class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(string)
    self.all.find do |startup|
      startup.founder == string
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |fr|
      fr.startup ==self
    end
  end


  def num_funding_rounds
    self.funding_rounds.length
  end

  def total_funds
    total = 0
    self.funding_rounds.map do |fr|
      total += fr.investment
    end
    total
  end

  def investors
    self.funding_rounds.map do |fr|
      fr.venture_capitalist
    end.uniq
  end

  def big_investors
    self.funding_rounds.map do |fr|
      if fr.venture_capitalist.total_worth > 1000000000
        fr.venture_capitalist
      end
    end
  end

end
