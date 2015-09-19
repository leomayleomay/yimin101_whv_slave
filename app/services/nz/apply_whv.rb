module NZ
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
        Task::NZ::Whv::Login.new(@customer),
        Task::Sleep.new(@customer),
        Task::NZ::Whv::ApplyNow.new(@customer),
        Task::NZ::Whv::Personal1.new(@customer),
        Task::NZ::Whv::Personal2.new(@customer),
        Task::NZ::Whv::Personal3.new(@customer),
        Task::NZ::Whv::Medical1.new(@customer),
        Task::NZ::Whv::Character.new(@customer),
        Task::NZ::Whv::Specific.new(@customer),
        Task::NZ::Whv::Submit.new(@customer),
        Task::NZ::Whv::Pay.new(@customer)
      ]
    end
  end
end