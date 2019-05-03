class Api::V2::BaseController < ApplicationController
    include devise_token_auth::Concerns::SetUserByToken
end