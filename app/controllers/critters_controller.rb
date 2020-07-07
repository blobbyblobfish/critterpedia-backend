class CrittersController < ApplicationController

    def bug_index
        @bugs = Critter.all.select do |critter|
            critter.category === "bug"
        end

        render json: @bugs
    end

    def fish_index
        @fish = Critter.all.select do |critter|
            critter.category === "fish"
        end

        render json: @fish
    end

    def sea_creature_index
        @sea_creatures = Critter.all.select do |critter|
            critter.category === "sea_creature"
        end

        render json: @sea_creatures
    end

end
