require 'nokogiri'

class BggImporter

  attr_reader :all_artists, :all_categories, :all_designers, :all_families,
              :all_honors, :all_mechanics, :all_publishers, :all_subdomains

  attr_reader :games, :artists, :categories, :designers, :families, :honors,
              :mechanics, :publishers, :subdomains

  def initialize
    @all_artists, @all_categories, @all_designers, @all_families = {}, {}, {}, {}
    @all_honors, @all_mechanics, @all_publishers, @all_subdomains = {}, {}, {}, {}
  end

  def import(xml_files)
    xml_files.each do |xml_file|
      puts xml_file
      if File.size(xml_file) == 0
        puts "file empty, skipping ..."
        next
      end

      @games, @artists, @categories, @designers, @families = [], [], [], [], []
      @honors, @mechanics, @publishers, @subdomains = [], [], [], []

      doc = Nokogiri::XML(File.open(xml_file)) do |config|
        config.options = Nokogiri::XML::ParseOptions::STRICT
      end

      doc.css("boardgame").each do |game_xml|
        game = Game.new(
            name: game_xml.css("name").text,
            description: game_xml.css("description").text,
            bgg_id: game_xml["objectid"],
            yearpublished: game_xml.css("yearpublished").text.to_i,
            minplayers: game_xml.css("minplayers").text.to_i,
            maxplayers: game_xml.css("maxplayers").text.to_i,
            playingtime: game_xml.css("playingtime").text.to_i,
            minplaytime: game_xml.css("minplaytime").text.to_i,
            maxplaytime: game_xml.css("maxplaytime").text.to_i,
            age: game_xml.css("age").text.to_i,
            thumbnail: game_xml.css("thumbnail").text,
            image: game_xml.css("image").text,
        )
        games << game

        game.artists << find_or_initialize_artists!(game_xml)
        game.categories << find_or_initialize_categories!(game_xml)
        game.designers << find_or_initialize_designers!(game_xml)
        game.families << find_or_initialize_families!(game_xml)
        game.honors << find_or_initialize_honors!(game_xml)
        game.mechanics << find_or_initialize_mechanics!(game_xml)
        game.publishers << find_or_initialize_publishers!(game_xml)
        game.subdomains << find_or_initialize_subdomains!(game_xml)
      end

      Creator.import artists
      Category.import categories
      Creator.import designers
      Family.import families
      Honor.import honors
      Mechanic.import mechanics
      Publisher.import publishers
      Subdomain.import subdomains
      Game.import games
    end
  end

  def find_or_initialize_artists!(game_xml)
    game_xml.css("boardgameartist").map do |artist|
      bgg_id = artist["objectid"]
      if all_artists[bgg_id]
        all_artists[bgg_id]
      else
        artist = Creator.new(bgg_id: artist["objectid"], name: artist.text)
        all_artists[bgg_id] = artist
        artists << artist
        artist
      end
    end
  end

  def find_or_initialize_categories!(game_xml)
    game_xml.css("boardgamecategory").map do |category|
      bgg_id = category["objectid"]
      if all_categories[bgg_id]
        all_categories[bgg_id]
      else
        category = Category.new(bgg_id: category["objectid"], name: category.text)
        all_categories[bgg_id] = category
        categories << category
        category
      end
    end
  end

  def find_or_initialize_designers!(game_xml)
    game_xml.css("boardgamedesigner").map do |designer|
      bgg_id = designer["objectid"]
      if all_designers[bgg_id]
        all_designers[bgg_id]
      else
        designer = Creator.new(bgg_id: designer["objectid"], name: designer.text)
        all_designers[bgg_id] = designer
        designers << designer
        designer
      end

    end
  end

  def find_or_initialize_families!(game_xml)
    game_xml.css("boardgamefamily").map do |family|
      bgg_id = family["objectid"]
      if all_families[bgg_id]
        all_families[bgg_id]
      else
        family = Family.new(bgg_id: family["objectid"], name: family.text)
        all_families[bgg_id] = family
        families << family
        family
      end
    end
  end

  def find_or_initialize_honors!(game_xml)
    game_xml.css("boardgamehonor").map do |honor|
      bgg_id = honor["objectid"]
      if all_honors[bgg_id]
        all_honors[bgg_id]
      else
        honor = Honor.new(bgg_id: honor["objectid"], name: honor.text)
        all_honors[bgg_id] = honor
        honors << honor
        honor
      end
    end
  end

  def find_or_initialize_mechanics!(game_xml)
    game_xml.css("boardgamemechanic").map do |mechanic|
      bgg_id = mechanic["objectid"]
      if all_mechanics[bgg_id]
        all_mechanics[bgg_id]
      else
        mechanic = Mechanic.new(bgg_id: mechanic["objectid"], name: mechanic.text)
        all_mechanics[bgg_id] = mechanic
        mechanics << mechanic
        mechanic
      end
    end
  end

  def find_or_initialize_publishers!(game_xml)
    game_xml.css("boardgamepublisher").map do |publisher|
      bgg_id = publisher["objectid"]
      if all_publishers[bgg_id]
        all_publishers[bgg_id]
      else
        publisher = Publisher.new(bgg_id: publisher["objectid"], name: publisher.text)
        all_publishers[bgg_id] = publisher
        publishers << publisher
        publisher
      end
    end
  end

  def find_or_initialize_subdomains!(game_xml)
    game_xml.css("boardgamesubdomain").map do |subdomain|
      bgg_id = subdomain["objectid"]
      if all_subdomains[bgg_id]
        all_subdomains[bgg_id]
      else
        subdomain = Subdomain.new(bgg_id: subdomain["objectid"], name: subdomain.text)
        all_subdomains[bgg_id] = subdomain
        subdomains << subdomain
        subdomain
      end
    end
  end
end
