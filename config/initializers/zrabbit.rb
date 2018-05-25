require 'rabbit_consumer'

unless ENV['UNICORN_CENIT_SERVER'].to_b
  Cenit::Application.config.after_initialize do
    Tenant.all.each do |tenant|
      tenant.switch do
        Setup::Scheduler.activated.each(&:start)
      end
    end
    Cenit::Rabbit.start_consumer
    Cenit::Rabbit.start_scheduler
  end
end
