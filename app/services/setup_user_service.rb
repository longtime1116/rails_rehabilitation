class SetupUserService
  private_class_method :new
  def initialize(params)
    @user = User.new(params)
  end

  def self.call(params)
    new(params).call
  end

  def call
    ActiveRecord::Base.transaction do
      @user.save!
      Customer.create!(user_id: @user.id)
    end
    @user
  rescue ActiveRecord::RecordInvalid
    @user
  end
end
