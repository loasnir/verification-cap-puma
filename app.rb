# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra'

get('/') { slim :index }
