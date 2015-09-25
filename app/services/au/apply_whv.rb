module AU
  class ApplyWhv
    def initialize(customer)
      @customer = customer
    end

    def call
      Headless.ly do
        begin
          tasks.each(&:execute)
        rescue Task::Error
          retry
        end
      end
    end

    protected

    def tasks
      @tasks ||= [
        Task::AU::Whv::Login.new(@customer),
        # Task::Sleep.new(@customer),
        Task::AU::Whv::ApplyNow.new(@customer),
        Task::AU::Whv::ValuesStatement.new(@customer),
        # Task::AU::Whv::IdentifyApplicantDetails.new(@customer),
        # Task::AU::Whv::CriticalDataConfirmation.new(@customer),
        # Task::AU::Whv::ApplicantDetailsCont.new(@customer),
        # Task::AU::Whv::ApplicantOffshoreAddress.new(@customer),
        # Task::AU::Whv::ApplicantOffshoreContact.new(@customer),
        # Task::AU::Whv::HealthDeclarations.new(@customer),
        # Task::AU::Whv::CharacterDeclarations.new(@customer),
        # Task::AU::Whv::ApplicationFinalDeclaration.new(@customer),
        # Task::AU::Whv::Review.new(@customer),
        # Task::AU::Whv::Pay.new(@customer)
      ]
    end
  end
end
