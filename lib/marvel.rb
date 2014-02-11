require "net/http"
require "uri"

class Marvel
  def self.load_characters
    ts = Time.now.to_i
    plain_secret = "#{ts}#{ENV["MARVEL_API_SECRET"]}#{ENV["MARVEL_API_KEY"]}"
    hash = Digest::MD5.hexdigest(plain_secret)
    
    url = "http://gateway.marvel.com:80/v1/public/characters?ts=#{ts}&apikey=#{ENV["MARVEL_API_KEY"]}&hash=#{hash}&limit=100"    
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    
    json_body = Oj.load(response.body)
    characters_data = json_body["data"]["results"]
    characters_data.each do |character_data|
      Character.find_or_create_by(marvel_id: character_data["id"], name: character_data["name"], thumbnail_image_url: "#{character_data["thumbnail"]["path"]}.#{character_data["thumbnail"]["extension"]}")
    end
  end
end