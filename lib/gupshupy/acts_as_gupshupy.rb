require 'httpclient'

module Gupshupy
  API_URL        = 'http://enterprise.smsgupshup.com/GatewayAPI/rest?'
  DEFAULT_PARAMS = {'method' => 'sendMessage', 'auth_type' => 'PLAIN'}

  module ActsAsGupshupy
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_gupshupy(options = {})
        cattr_accessor :mobile_number_field, :userid, :password
        self.mobile_number_field = (options[:mobile_number_field] || :mobile_number).to_s
        self.userid              = options[:userid].to_s
        self.password            = options[:password].to_s

        raise "Please specify SMSGupShup userid" if self.userid.blank?
        raise "Please specify SMSGupShup password" if self.password.blank?
      end
    end

    def send_sms(message, mobile_number=nil)
      mobile_number = mobile_number.blank? ? self.send(mobile_number_field) : mobile_number
      client = HTTPClient.new
      params = DEFAULT_PARAMS.clone.merge({ 'userid' => userid, 'password' => password, 'send_to' => mobile_number, 'msg' => message })
      params = params.map{ |k, v| k + '=' + URI.escape(v)}.join('&')
      result = client.get(Gupshupy::API_URL + params)

      if result.status == 200 && result.content.match('^success')
        return result.content.match('^success \| (\d{12}) \| (\d+)-(\d+)')[3] # return the message id
      else
        raise Exception.new("sms sending failed")
      end
    end
  end
end

ActiveRecord::Base.send :include, Gupshupy::ActsAsGupshupy
