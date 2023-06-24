require 'aws-sdk-ssm'

class EnvGetter
  def get_parameter(parameter_name)
    ssm_client = Aws::SSM::Client.new(region: 'ap-northeast-1')
    response = ssm_client.get_parameter({
      name: parameter_name,
      with_decryption: true
    })
    response.parameter.value
  end
end
