require 'faraday'
require 'faraday-cookie_jar'
require 'json'

module CoinExchange
  class Client
    HOST = 'https://www.coinexchange.io/api/v1'

    def initialize
    end

    def get(path, params={}, headers={})
      tries ||= 3
      response = connection.get do |req|
        req.url           path
        req.params.merge!(params)
      end

      # At times the API seems to need a cookie being set,
      # if it's not set we get a 200 response with a content-type of 'text/html'
      # and a short bit of html with a meta refresh tag to reload the page
      raise BadResponse unless response.headers['content-type'] == "application/json"
    rescue BadResponse
      #retry unless (tries -= 1).zero?
    else
      #response.body
      JSON.parse(response.body)['result']
    end

    class BadResponse < RuntimeError  
    end  

    private
    def connection
      @connection ||= Faraday.new(:url => HOST) do |faraday|
        faraday.request   :url_encoded
        faraday.use       :cookie_jar
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter   Faraday.default_adapter
      end
    end
  end
end
