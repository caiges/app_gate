ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require 'app_gate'
require 'rack/test'
require 'sinatra/base'

class TestingApp < Sinatra::Base
  use AppGate::Middleware

  get '/' do
    'Win!'
  end

  get '/all_the_things' do
    'Things!'
  end
end

describe 'TestingApp' do
  include Rack::Test::Methods

  def app
    TestingApp.new
  end

  it 'should fail authentication without proper HTTP header' do
    get '/'
    expect(last_response).to_not be_ok
    expect(last_response.body).to eq('401 Not Authorized')
  end

  it 'should pass authorization with a proper HTTP header' do
    AppGate::Apps.stubs(:ids).returns({ taco: '123'})
    header('APP_GATE_APP_ID', '123')
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Win!')
  end
end

