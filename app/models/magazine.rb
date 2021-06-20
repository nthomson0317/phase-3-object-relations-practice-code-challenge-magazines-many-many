class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions
  
    def email_list
        self.readers.pluck(:email).join(";")
    end

    def Magazine.most_popular
        Magazine.all.max_by { |mag| mag.subscriptions.length }
    end
end