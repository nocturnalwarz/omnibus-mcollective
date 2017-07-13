name "mcollective-puppet-agent"
default_version "1.13.1"

dependency "mcollective"

version("1.13.1") { source md5: 'aee56b2b4542b8ffaee3ed40929be7ea' }

source url: "https://github.com/puppetlabs/mcollective-puppet-agent/archive/#{version}.tar.gz"

relative_path = "mcollective-puppet-agent-#{version}"

build do
  block do
    %w(agent aggregate application data util validator).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-puppet-agent-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end