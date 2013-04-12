class Buyer < DelegateClass(User)
    delegate :id, to: :__getobj__

    def has_orders
        self.orders.present?
    end
end
