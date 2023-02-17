# frozen_string_literal: true

# Sinatra base app that validates Mod97
class ValidateMod97 < Sinatra::Base
  configure do
    set :views, 'app/views'
    set :public_dir, 'public'
  end

  get '/' do
    erb :index
  end

  get '/calculate' do
    action = 'Calculate'
    erb :form, locals: { action: action }
  end

  post '/calculate' do
    validating = nil
    result = calculate(params[:ref])
    erb :result, locals: { reference: params[:ref], result: result, validating: validating }
  end

  get '/validate' do
    action = 'Validate'
    erb :form, locals: { action: action }
  end

  post '/validate' do
    validating = true
    checkdig = calculate(params[:ref])
    result = validate(params[:ref])
    erb :result, locals: {
      reference: params[:ref],
      result: result,
      validating: validating,
      checkdig: checkdig
    }
  end

  private

  def calculate(iban)
    iban_calc_part = "#{iban[4..]}#{iban[0].ord - 55}#{iban[1].ord - 55}00"
    (98 - (iban_calc_part.to_i % 97)).to_s.rjust(2, '0')
  end

  def validate(iban)
    sec_dig = iban[2..3]
    sec_dig == calculate(iban)
  end
end
