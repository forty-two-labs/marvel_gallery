require 'marvel'

namespace :marvel do
  desc "Download marvel data from marvel.com"
  task download_data: :environment do
    Marvel.load_characters
  end

end
