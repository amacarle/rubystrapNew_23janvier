require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'


def pageUrl
  return page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end 


def currency_table(page)
  crypto_currency = []
  page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[3]').each do |key|
  crypto_currency << key.text
  end
  return crypto_currency
end

def values_table(page)
  currency_value = []
  page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[5]').each do |value|
  currency_value << value.text
  end
  return currency_value
end

def cryptohash(crypto_currency, currency_value)
  hash = Hash[crypto_currency.zip(currency_value)]
  array_of_hashes = []
  hash.each{|key, value| array_of_hashes << {key => value.delete("$").to_f}}
  return array_of_hashes
end


def perform
  puts cryptohash(currency_table(pageUrl), values_table(pageUrl))
end
perform


# crypto_currency = []
# page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[3]').each do |key|
# crypto_currency << key.text
# end


# hash_currency = {}
# crypto_names.each_with_index {|k,i|hash_currency[k] = crypto_values[i]}
# puts hash_currency

#def array_of_hashes(hash_currency)
#    crypto_hash_array = []
#    hash_currency.each {|m,n| crypto_hash_array << {m => n.delete("$").to_f}}
#    return crypto_hash_array
#end

#put crypto_hash_array

#CHELTONNE
#def array_of_hashes(hash)
#    crypto_hash_array = []
#    hash.each {|k,v| crypto_hash_array << {k => v.delete("$").to_f}}
#    return crypto_hash_array
#end


#def  hash(crypto_currency,crypto_values)
#    crypto_hash= Hash[crypto_currency.zip(crypto_values)]
#    return crypto_hash
#end

#puts crypto_hash