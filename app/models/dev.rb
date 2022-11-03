class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.where(item_name: item_name).any?
    end

    def give_away(dev, freebie)
        if self.received_one?(freebie.item_name)
            freebie.update(dev_id: dev.id)
        else puts "you don't have this item to give away!"
        end
    end
end
