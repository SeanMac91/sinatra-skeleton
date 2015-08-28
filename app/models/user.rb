class User < ActiveRecord::Base

has_many :movie
has_many :review
end