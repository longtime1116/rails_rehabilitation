class SetupUserService
  private_class_method :new
  def self.call(params)
    new.call(params)
  end

  def call(params)
    user = User.new(params)
    user.transaction do
      user.save!
      Customer.new(user_id: user.id).save!
    end
    user
  rescue StandardError => e
    nil
  end
end
