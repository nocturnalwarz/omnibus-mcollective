name "mcollective-puppet-agent"
default_version "1.14.0"

dependency "mcollective"

version("1.14.0") { source md5: '88e82dfda2a2be5a6334ccebcc49149d' }

source url: "https://github.com/puppetlabs/mcollective-puppet-agent/archive/#{version}.tar.gz"

relative_path = "mcollective-puppet-agent-#{version}"

build do
  block do
    %w(agent aggregate application data util validator).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-puppet-agent-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end