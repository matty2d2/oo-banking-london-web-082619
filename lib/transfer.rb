class Transfer
  attr_accessor :status
    attr_reader :sender, :receiver, :amount
    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end

    def valid?
      @receiver.valid? && sender.valid?
    end

    def execute_transaction
      if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if valid? && sender.balance > amount && self.status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      end
    end
end
