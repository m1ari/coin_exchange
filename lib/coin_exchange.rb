require "coin_exchange/version"

module CoinExchange
  autoload :Client,   'coin_exchange/client'

  def self.client
    @client ||= Client.new
  end

end
