name "mcollective-package-agent"
default_version "4.5.0"

dependency "mcollective"

version("4.5.0") { source md5: '63e330945b9dd603509934ce102b5411' }

source url: "https://github.com/puppetlabs/mcollective-package-agent/archive/#{version}.tar.gz"

relative_path = "mcollective-package-agent-#{version}"

build do
  block do
    %w(agent application data util validator).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-package-agent-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end