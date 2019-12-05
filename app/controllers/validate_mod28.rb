class ValidateMod28 < Sinatra::Base
	
	configure do
		set :views, 'app/views'
		set :public_dir, 'public'
	end

	get "/" do
		erb :index
	end

	get "/validate" do
		erb :form
	end

	post "/validate" do
		erb :form
	end

	private

	def validate(iban, digits)
		true
	end
end
