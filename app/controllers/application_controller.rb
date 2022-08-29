class ApplicationController < ActionController::API
    include ActionController::Cookies
    include SessionsHelper

    def hello
        render html: 'hello, world!'
    end
end
