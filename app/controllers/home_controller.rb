class HomeController < ApplicationController
  before_action:authenticate_user!
  def index
    @api = IEX::Api::Client.new(
      publishable_token: 'pk_2e5ab5f95c44488c8d01c4d54e1de40b',
      secret_token: 'sk_db2a93eed5d043d39efae04f4076a808',
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    if params[:ticker] == ""
      @nothing = "Hey! You Forgot to Enter a Symbol!"
    elsif params[:ticker]
      @stock = @api.quote(params[:ticker])
      if IEX::Errors::SymbolNotFoundError
        @error = "Hey! That Stock Symbol Does not exist!"
      end
    end
  end
 


  def about
  end
  
end
