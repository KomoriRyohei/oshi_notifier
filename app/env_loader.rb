class EnvLoader
  def parse_env_file
    File.readlines('.env.local').each_with_object({}) do |line, env_vars|
      key, value = line.strip.split('=', 2)
      env_vars[key] = value
    end
  end
end
