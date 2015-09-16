class ApplyWhv
  def initialize(customer)
    @customer = customer
  end

  def call
    begin
      tasks.each(&:execute)
    rescue Task::Error
      retry
    end
  end

  protected

  def tasks
    @tasks ||= [
      Task::Whv::Login.new(@customer),
      Task::Sleep.new(@customer),
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
