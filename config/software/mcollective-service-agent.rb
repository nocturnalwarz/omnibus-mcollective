name "mcollective-service-agent"
default_version "3.1.5"

dependency "mcollective"

version("3.1.5") { source md5: 'e1642ecec144e7c8a381298bde8085b7' }

source url: "https://github.com/puppetlabs/mcollective-service-agent/archive/#{version}.tar.gz"

relative_path = "mcollective-shell-agent-#{version}"

build do
  block do
    %w(agent application data util validator).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-service-agent-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end