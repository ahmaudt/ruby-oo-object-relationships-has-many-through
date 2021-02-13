require 'pry'
require_relative './customer.rb'
require_relative './meal.rb'

class Waiter
    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |order| order.waiter == self }
    end

    def best_tipper
        customer_tips = nil
        big_tip = meals.map { |customer| customer.tip }
        # tips = meals.map do |customer|
        #     customer.tip.max
        # end
        # puts tips.max
        big_tipper = big_tip.max
        binding.pry
        meals.select do |customer| 
            if customer.tip == big_tipper
                customer_tips = customer.customer
            end
        end
        customer_tips
    end
end