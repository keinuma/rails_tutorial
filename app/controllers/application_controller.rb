class ApplicationController < ActionController::API
    include ActionController::Cookies

    def hello
        render html: 'hello, world!'
    end
end
