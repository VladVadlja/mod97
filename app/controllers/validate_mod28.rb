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
		@result = "#{params[:iban]} #{params[:digits]}"
		erb :result, :locals => {:result => @result }
	end

	private

	def validate(iban, digits)
		true
	end
end
