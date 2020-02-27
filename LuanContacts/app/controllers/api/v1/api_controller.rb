#Esse módulo vai herdar tudo o que tiver no arquivo Application_controller para que nao haja perda de 
#informaçòes.
module Api::V1
  class ApiController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :require_authentication!
 
  private
    def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
    end
  end
 end