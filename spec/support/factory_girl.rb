RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end

FactoryGirl.define do

	factory :user do
		email 'test@test.com'
		password 'test1234'
	end

	factory :event do
		name 'Test event'
		address 'Statue of Liberty'
	end
end
