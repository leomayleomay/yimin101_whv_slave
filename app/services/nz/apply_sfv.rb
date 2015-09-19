module NZ
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
        Task::NZ::Sfv::Login.new(@customer),
        Task::Sleep.new(@customer),
        Task::NZ::Sfv::ApplyNow.new(@customer),
        Task::NZ::Sfv::Personal1.new(@customer),
        Task::NZ::Sfv::Personal2.new(@customer),
        Task::NZ::Sfv::Personal3.new(@customer),
        Task::NZ::Sfv::Medical1.new(@customer),
        Task::NZ::Sfv::Character.new(@customer),
        Task::NZ::Sfv::Specific.new(@customer),
        Task::NZ::Sfv::Submit.new(@customer),
        Task::NZ::Sfv::Pay.new(@customer)
      ]
    end
  end
end