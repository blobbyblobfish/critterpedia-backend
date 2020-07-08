class CrittersController < ApplicationController

    def bug_index
        @bugs = Critter.all.select do |critter|
            critter.category === "bug"
        end

        sorted_bugs = @bugs.sort_by do 
            |bug| bug.game_id
        end

        render json: sorted_bugs
    end

    def fish_index
        @fish = Critter.all.select do |critter|
            critter.category === "fish"
        end

        sorted_fish = @fish.sort_by do |fish|
            fish.game_id
        end

        render json: sorted_fish
    end

    def sea_creature_index
        @sea_creatures = Critter.all.select do |critter|
            critter.category === "sea_creature"
        end

        sorted_sea_creatures = @sea_creatures.sort_by do |sea_creature|
            sea_creature.game_id
        end

        render json: sorted_sea_creatures
    end

end
