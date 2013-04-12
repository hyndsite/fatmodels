class Seller < DelegateClass(User)
    delegate :id, to: :__getobj__
    def has_seller_transactions?
        return false if self.orders.empty?

        self.orders.each do |order|
          return true unless order.has_seller_transaction.nil?
        end
     end

     def has_market_place?
        self.has_market_places.blank?
     end

end
