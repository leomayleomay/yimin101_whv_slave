module Task
  module Whv
    class Sleep < Task::Base
      APPLICATION_START_TIME = Time.new(2015,11,20,10,0,0)
      RELOAD_INTERVAL = 60 * 10 # 10 mins

      protected

      def succeed!
        #no-op
      end

      def fail_with_error!(message, backtrace)
        #no-op
      end

      def url
        current_url
      end

      def do_execute
        start_time = Time.now

        while Time.now < APPLICATION_START_TIME
          sleep(1)

          if (Time.now.to_i - start_time.to_i) % RELOAD_INTERVAL == 0
            visit(url)
          end
        end
      end
    end
  end
end
