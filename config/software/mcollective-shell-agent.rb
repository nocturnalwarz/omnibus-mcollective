name "mcollective-shell-agent"
default_version "0.0.2"

dependency "mcollective"

version("0.0.2") { source md5: '7ea613ee73e8ae9aad705972572b26d0' }

source url: "https://github.com/puppetlabs/mcollective-shell-agent/archive/#{version}.tar.gz"

relative_path = "mcollective-shell-agent-#{version}"

build do
  block do
    %w(agent application).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-package-agent-#{version}/lib/mcollective/", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end