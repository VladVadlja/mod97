class ValidateMod97 < Sinatra::Base
	
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
		result = validate(params[:ref])
		erb :result, :locals => {reference: params[:ref], result: result}
	end

	private

	def validate(iban)
		sec_dig = iban[2..3]
		iban_calc_part = "#{iban[4..-1]}#{iban[0].ord - 55}#{iban[1].ord - 55}#{"00"}"
		(98 - (iban_calc_part.to_i % 97)).to_s.rjust(2, "0")
	end

end
