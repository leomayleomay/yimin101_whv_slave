class ApplySfv
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
      Task::Sfv::Login.new(@customer),
      Task::Sleep.new(@customer),
      Task::Sfv::ApplyNow.new(@customer),
      Task::Sfv::Personal1.new(@customer),
      Task::Sfv::Personal2.new(@customer),
      Task::Sfv::Personal3.new(@customer),
      Task::Sfv::Medical1.new(@customer),
      Task::Sfv::Character.new(@customer),
      Task::Sfv::Specific.new(@customer),
      Task::Sfv::Submit.new(@customer),
      Task::Sfv::Pay.new(@customer)
    ]
  end
end
