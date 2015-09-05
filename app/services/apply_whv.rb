class ApplyWhv
  MAX_RETRIES = 3

  def initialize(customer)
    @customer = customer
  end

  def call
    begin
      tasks.each(&:execute)
    rescue Task::Error => e
      @retries ||= 0

      if @retries < MAX_RETRIES
        @retries += 1
        retry
      else
        raise e
      end
    end
  end

  protected
  def tasks
    [
      Task::Whv::Login.new(@customer),
      Task::Whv::ApplyNow.new(@customer),
      Task::Whv::Personal1.new(@customer),
      Task::Whv::Personal2.new(@customer),
      Task::Whv::Personal3.new(@customer),
      Task::Whv::Medical1.new(@customer),
      Task::Whv::Character.new(@customer),
      Task::Whv::Specific.new(@customer),
      Task::Whv::Submit.new(@customer),
      Task::Whv::Pay.new(@customer)
    ]
  end
end
