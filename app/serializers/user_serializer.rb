class UserSerializer < ApplicationSerializer

    root_key :user

    attributes :id,
               :email,
               :name,
               :created_at
end
