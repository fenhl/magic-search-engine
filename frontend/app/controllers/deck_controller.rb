class DeckController < ApplicationController
  def show
    @decklist = load_decklist(params[:id])
    @preview_card = $CardDatabase.sets["xln"].printings.first
    @type = @decklist[:type]
    @name = @decklist[:name]
    @set_code = @decklist[:set_code]
    @set_name = @decklist[:set_name]
    @cards = @decklist[:cards].map{|c|
      {
        count: c[:count],
        name: c[:name],
        card: find_card(c[:name], @set_code),
      }
    }
    @sideboard = @decklist[:sideboard].map{|c|
      {
        count: c[:count],
        name: c[:name],
        card: find_card(c[:name], @set_code),
      }
    }
    @card_previews = (@cards+@sideboard).map{|c| c[:card]}.compact.uniq
    @card_groups = @cards.group_by{|c|
      if c[:card].nil?
        [0, "Unknown"]
      elsif c[:card].types.include?("creature")
        [1, "Creature"]
      elsif c[:card].types.include?("planeswalker")
        [2, "Planeswalker"]
      elsif c[:card].types.include?("instant")
        [3, "Instant"]
      elsif c[:card].types.include?("sorcery")
        [4, "Sorcery"]
      elsif c[:card].types.include?("artifact")
        [5, "Artifact"]
      elsif c[:card].types.include?("enchantment")
        [6, "Enchantment"]
      elsif c[:card].types.include?("land")
        [7, "Land"]
      else
        [8, "Other"]
      end
    }
    unless @sideboard.empty?
      @card_groups[[9, "Sideboard"]] = @sideboard
    end
    @card_groups = @card_groups.sort
  end

  private

  def find_card(name, set_code)
    printings = $CardDatabase.search("!#{name}").printings
    printings.find{|c| c.set_code == set_code} or printings.first
  end

  def load_decklist(id)
    if id == "1"
      {
        "cards": [
          { "count": 2, "name": "Sun-Blessed Mount" },
          { "count": 1, "name": "Goring Ceratops" },
          { "count": 1, "name": "Burning Sun's Avatar" },
          { "count": 2, "name": "Kinjalli's Caller" },
          { "count": 4, "name": "Huatli's Snubhorn" },
          { "count": 2, "name": "Raptor Companion" },
          { "count": 2, "name": "Tilonalli's Knight" },
          { "count": 2, "name": "Frenzied Raptor" },
          { "count": 2, "name": "Territorial Hammerskull" },
          { "count": 2, "name": "Bonded Horncrest" },
          { "count": 2, "name": "Pterodon Knight" },
          { "count": 2, "name": "Shining Aerosaur" },
          { "count": 3, "name": "Huatli's Spurring" },
          { "count": 2, "name": "Slash of Talons" },
          { "count": 2, "name": "Lightning Strike" },
          { "count": 2, "name": "Rallying Roar" },
          { "count": 4, "name": "Stone Quarry" },
          { "count": 11, "name": "Mountain" },
          { "count": 11, "name": "Plains" },
          { "count": 1, "name": "Huatli, Dinosaur Knight" }
        ],
        "name": "Huatli, Dinosaur Knight",
        "set_code": "xln",
        "set_name": "Ixalan",
        "sideboard": [
        ],
        "type": "Planeswalker Deck"
      }
    else
      {
        "cards": [
          { "count": 1, "name": "Cemetery Reaper" },
          { "count": 2, "name": "Crypt Creeper" },
          { "count": 4, "name": "Diregraf Ghoul" },
          { "count": 1, "name": "Geralf's Messenger" },
          { "count": 3, "name": "Ghoulraiser" },
          { "count": 1, "name": "Gloom Surgeon" },
          { "count": 1, "name": "Gravecrawler" },
          { "count": 4, "name": "Highborn Ghoul" },
          { "count": 4, "name": "Skinrender" },
          { "count": 3, "name": "Despise" },
          { "count": 3, "name": "Altar's Reap" },
          { "count": 2, "name": "Dismember" },
          { "count": 2, "name": "Doom Blade" },
          { "count": 3, "name": "Go for the Throat" },
          { "count": 2, "name": "Lashwrithe" },
          { "count": 24, "name": "Swamp" }
        ],
        "name": "Death's Encroach",
        "set_code": "avr",
        "set_name": "Avacyn Restored",
        "sideboard": [
          { "count": 2, "name": "Crypt Creeper" },
          { "count": 1, "name": "Ghoulraiser" },
          { "count": 1, "name": "Despise" },
          { "count": 2, "name": "Appetite for Brains" },
          { "count": 3, "name": "Deathmark" },
          { "count": 2, "name": "Distress" },
          { "count": 1, "name": "Surgical Extraction" },
          { "count": 3, "name": "Triumph of Cruelty" }
        ],
        "type": "Event Deck"
      }
    end
  end
end
